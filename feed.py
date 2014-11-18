# Feed.py
import webapp2
import cgi

from entry import Entry
import datastore

from lxml import etree

class Feed(webapp2.RequestHandler):

    def get(self):
        # get all the entries
        catalogue_name = self.request.get('catalogue_name',
            datastore.DEFAULT_CATALOGUE_NAME)
        catalogue_query = Entry.query(
            ancestor=datastore.create_entry_key(catalogue_name)).order(-Entry.date)
        entries = catalogue_query.fetch()

        # wrap feed around the entries
        xml = '''\
        <feed xmlns="http://www.w3.org/2005/Atom"
        xmlns:media="http://search.yahoo.com/mrss/">'''
        for entry in entries:
            xml = xml + entry.mytoXML(self.request.scheme + '://' + self.request.host)
        xml = xml + '''
        </feed>'''

        # create etree xml doc
        #f = StringIO(xml)
        doc = etree.XML(xml)

        self.response.headers['Content-Type'] = 'text/plain'
        self.response.write(xml)

