from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/plain")
            self.end_headers()
            self.wfile.write(b"Hello from balolo test server!\n")

if __name__ == "__main__":
    host = "localhost"
    port = 8080
    
    server_address = (host, port)
    httpd = HTTPServer(server_address, SimpleRequestHandler)
    print(f"Serving GET requests on {host}:{port}")
    httpd.serve_forever()
