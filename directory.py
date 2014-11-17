import webapp2
import cgi

class Directory(webapp2.RequestHandler):
    directory =  [ '/press','/article','/','/directory' ]
    direntry = '''\
    <blockquote><a href="%s">%s</a></blockquote>
    '''
    def get(self):
        for i in self.directory:
            e = cgi.escape(i)
            self.response.write(self.direntry % (e,e))