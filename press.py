import cgi
import urllib
import webapp2

from google.appengine.api import users
from entry import Entry
import datastore

from datetime import datetime


class Press(webapp2.RequestHandler):

    PRESS_PAGE_FOOTER_TEMPLATE = """\
        <form action="/press?%s" method="post">
            <div><div class="label">title</div><textarea name="title" rows="1" cols="60"></textarea></div>
            <div><div class="label">summary</div><textarea name="summary" rows="1" cols="60"></textarea></div>

            <div><div class="label">thumbnail</div><textarea name="thumbnail" rows="5" cols="120"></textarea></div>
            <div><div class="label">content</div><textarea name="content" rows="10" cols="120"></textarea></div>
            <div><div class="label">category</div>


            <input type="radio" id="c1" name="category" value="Welcome" checked>
            <label for="c1">Welcome</label>

            <input type="radio" id="c2" name="category" value="Services" >
            <label for="c2">Services</label>

            <input type="radio" id="c3" name="category" value="Profile" >
            <label for="c3">Profile</label>

            <input type="radio" id="c4" name="category" value="Food" >
            <label for="c4">Food</label>

            <input type="radio" id="c5" name="category" value="Tech" >
            <label for="c5">Tech</label>

            <input type="radio" id="c6" name="category" value="Art" >
            <label for="c6">Art</label>

            <div><input type="submit" value="Blog Post"></div>
            </form>
            <hr>
            <a href="%s">%s</a>
        </body>
        </html>
    """

    def get(self):
        self.response.write(''' \
            <html><head>
            <title> Designr8.com Press </title>
            <link rel="stylesheet" type="text/css" href="/styles/press.css" />
            </head>
            <body><h2>Designr8.com Press</h2>''')

        catalogue_name = self.request.get('catalogue_name',
                                          datastore.DEFAULT_CATALOGUE_NAME)

        catalogue_query = Entry.query(
            ancestor= datastore.create_entry_key(catalogue_name)).order(-Entry.date)

        entries = catalogue_query.fetch()

        if users.get_current_user():
            url = users.create_logout_url(self.request.uri)
            url_linktext = 'Logout ' +   users.get_current_user().nickname()
        else:
            url = users.create_login_url(self.request.uri)
            url_linktext = 'Login'

        # Write the submission form and the footer of the page
        sign_query_params = urllib.urlencode({'catalogue_name': catalogue_name})

        self.response.write(self.PRESS_PAGE_FOOTER_TEMPLATE % (sign_query_params, url, url_linktext))



    def post(self) :
        catalogue_name = self.request.get('catalogue_name',
                                          datastore.DEFAULT_CATALOGUE_NAME)
        entry = Entry(parent=datastore.create_entry_key(catalogue_name))

        entry.content = self.request.get('content').rstrip().lstrip()
        entry.title = self.request.get('title').rstrip().lstrip()
        entry.summary = self.request.get('summary').rstrip().lstrip()
        entry.category = self.request.get('category').rstrip().lstrip()
        entry.date = datetime.now()
        entry.thumbnail = self.request.get('thumbnail').rstrip().lstrip()
        entry.put()

        query_params = {'catalogue_name': catalogue_name}
        self.redirect('/directory')

