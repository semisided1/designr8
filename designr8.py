import webapp2

from directory import Directory
from article import Article
from press import Press
from root import Root
from feed import Feed

application = webapp2.WSGIApplication([
    ('/press', Press),
    ('/article', Article),
    ('/',Root),
    ('/directory',Directory),
    ('/feed',Feed)
], debug=True)