import webapp2
import cgi

from entry import Entry
import datastore

from lxml import etree

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
        # get all the entries
        catalogue_name = self.request.get('catalogue_name',
            datastore.DEFAULT_CATALOGUE_NAME)
        catalogue_query = Entry.query(
            ancestor=datastore.create_entry_key(catalogue_name)).order(-Entry.date)
        entries = catalogue_query.fetch()

        # wrap feed around the entries
        xml = '''\
        <feed xmlns="http://www.w3.org/2005/Atom"
            xmlns:media="http://search.yahoo.com/mrss/">
        '''
        for entry in entries:
            xml = xml + entry.content
        xml = xml + '</feed>'
        # create etree xml doc
        #f = StringIO(xml)
        doc = etree.XML(xml)

        # create transformer from xsl
        xsl_file = './styles/bloglist.xsl'
        xsl_root = etree.parse(xsl_file)
        transformer = etree.XSLT(xsl_root)

        result_tree = transformer(doc)

        self.response.write(str(result_tree))

