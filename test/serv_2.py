#!/usr/bin/env python
import SimpleHTTPServer
import SocketServer

PORT = 8010


class MyHTTPRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_my_headers()

        SimpleHTTPServer.SimpleHTTPRequestHandler.end_headers(self)

    def send_my_headers(self):
    	if 'cookie' in self.headers.keys(): 
    		self.send_header("cookie", "JSESSIONID=2")
    	else:
        	self.send_header("set-cookie", "JSESSIONID=2")


Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

httpd = SocketServer.TCPServer(("", PORT), MyHTTPRequestHandler)

print "serving at port", PORT
httpd.serve_forever()