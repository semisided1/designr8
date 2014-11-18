from google.appengine.ext import ndb
import urllib

class Entry(ndb.Model):
    """Models an individual entry."""
    title = ndb.StringProperty(indexed=False)
    summary = ndb.StringProperty(indexed=False)
    category = ndb.StringProperty(indexed=False)
    thumbnail = ndb.StringProperty(indexed=False)
    content = ndb.StringProperty(indexed=False)
    date = ndb.DateTimeProperty(auto_now_add=True)

    def mytoXML(self, baseurl):
        link = baseurl + '/article?%s' % urllib.urlencode({'title':self.title})
        feedid = link

        toret = '''
<entry>
<title>%s</title>
<link>%s</link>
<id>%s</id>
<summary type="html">%s</summary>
<category>%s</category>
<media:thumbnail url="%s"></media:thumbnail>
<updated>%s</updated>
<content type="xhtml"><div xmlns="http://www.w3.org/1999/xhtml">%s</div></content>
</entry>
'''
        return toret % (self.title,link,feedid,self.summary,self.category,self.thumbnail,self.date, self.content)



