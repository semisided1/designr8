import webapp2

BLANK_PAGE = '''\
<html>
<head>
<title>blank</title>
</head>
<body>
blank
</body>
</html>
'''

class Article(webapp2.RequestHandler):
    def get(self):
        self.response.write(BLANK_PAGE)