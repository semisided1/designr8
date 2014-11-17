# datastore module
#

from google.appengine.ext import ndb

from entry import Entry

DEFAULT_CATALOGUE_NAME = 'default_catalogue'

def create_entry_key(self, catalogue_name = DEFAULT_CATALOGUE_NAME):
    """Constructs a Datastore key for a entry entity with catalogue_name."""
    return ndb.Key('Catalogue', catalogue_name)
