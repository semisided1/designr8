import webapp2
import cgi

from entry import Entry
import datastore


class Root(webapp2.RequestHandler):

    ROOT_PAGE = '''\
        <html>
        <head></head>
        <title>Designr8.com</title>
        <body>
            <h1> Blank Page </h1>
            <pre>
                %s
            </pre>
        </body>
        </html>
    '''

    def get(self):
       catalogue_name = self.request.get('catalogue_name',
                                          datastore.DEFAULT_CATALOGUE_NAME)
       catalogue_query = Entry.query(
            ancestor=datastore.create_entry_key(catalogue_name)).order(-Entry.date)

       entries = catalogue_query.fetch()
       self.response.write('<h1>Root</h1>')
       for entry in entries:
            self.response.write('<hr/><blockquote>%s</blockquote>' %
                cgi.escape(entry.content))