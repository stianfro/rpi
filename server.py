import os
from http.server import BaseHTTPRequestHandler, HTTPServer
from sense_hat import SenseHat

def get_cpu_temp():
    with open("/sys/class/thermal/thermal_zone0/temp") as file:
        cpu_temp = float(file.read()) / 1000.0
    return cpu_temp

def get_corrected_temp(sense):
    sense_temp = sense.get_temperature()
    cpu_temp = get_cpu_temp()
    corrected_temp = sense_temp - ((cpu_temp - sense_temp) / 1.5)
    return corrected_temp

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        sense = SenseHat()

        if self.path == '/api/v1/healthz':
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            self.wfile.write(b"ok")
            sense.show_message("ok", scroll_speed=0.01)
        elif self.path == '/metrics':
            temperature = get_corrected_temp(sense)
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            self.wfile.write(f"temperature {temperature:.2f}\n".encode())
        else:
            self.send_response(404)
            self.end_headers()

def run(server_class=HTTPServer, handler_class=SimpleHTTPRequestHandler, port=8000):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f"Starting httpd server on port {port}")
    httpd.serve_forever()

run()