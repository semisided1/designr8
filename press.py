import cgi
import urllib
import webapp2

from google.appengine.api import users
from entry import Entry
import datastore



class Press(webapp2.RequestHandler):

    PRESS_PAGE_FOOTER_TEMPLATE = """\
        <form action="/press?%s" method="post">
            <div><textarea name="content" rows="3" cols="60"></textarea></div>
            <div><input type="submit" value="Blog Post"></div>
            </form>
            <hr>
            <a href="%s">%s</a>
        </body>
        </html>
    """

    def get(self):
        self.response.write('<html><body><h2>Add blog entry as xml</h2>')

        catalogue_name = self.request.get('catalogue_name',
                                          datastore.DEFAULT_CATALOGUE_NAME)

        catalogue_query = Entry.query(
            ancestor= datastore.create_entry_key(catalogue_name)).order(-Entry.date)

        entries = catalogue_query.fetch()

        for entry in entries:
            self.response.write('<hr/><blockquote>%s</blockquote>' %
                                cgi.escape(entry.content))

        self.response.write('<hr/>')

        if users.get_current_user():
            url = users.create_logout_url(self.request.uri)
            url_linktext = 'Logout ' +   greeting.author.nickname()
        else:
            url = users.create_login_url(self.request.uri)
            url_linktext = 'Login'

        # Write the submission form and the footer of the page
        sign_query_params = urllib.urlencode({'catalogue_name': catalogue_name})

        self.response.write(self.PRESS_PAGE_FOOTER_TEMPLATE %
                            (sign_query_params,
                             url, url_linktext))

    def post(self) :
        catalogue_name = self.request.get('catalogue_name',
                                          datastore.DEFAULT_CATALOGUE_NAME)
        entry = Entry(parent=datastore.create_entry_key(catalogue_name))

        entry.content = self.request.get('content')
        entry.put()

        query_params = {'catalogue_name': catalogue_name}
        self.redirect('/?' + urllib.urlencode(query_params))

