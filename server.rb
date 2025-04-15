require 'socket'

server = TCPServer.new('localhost', 3000)
puts "🚀 Listening on http://localhost:3000..."

loop do
  client = server.accept
  request = client.gets
  puts "📩 Received request: #{request}"

  response = "Hello from Ruby Web Server! 🌐"
  client.print "HTTP/1.1 200 OK\r\n" \
               "Content-Type: text/plain\r\n" \
               "Content-Length: #{response.bytesize}\r\n" \
               "Connection: close\r\n"

  client.print "\r\n"
  client.print response
  client.close
end
