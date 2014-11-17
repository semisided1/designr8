import webapp2

from directory import Directory
from article import Article
from press import Press
from root import Root

application = webapp2.WSGIApplication([
    ('/press', Press),
    ('/article', Article),
    ('/',Root),
    ('/directory',Directory)
], debug=True)