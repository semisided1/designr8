from google.appengine.ext import ndb

class Entry(ndb.Model):
    """Models an individual entry."""

    content = ndb.StringProperty(indexed=False)
    date = ndb.DateTimeProperty(auto_now_add=True)



