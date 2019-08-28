require 'webrick'

module WEBrick
          module HTTPServlet
            FileHandler.add_handler('rb', CGIHandler)
          end
        end
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
          :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
          :Port => '3000',
})
['INT', 'TERM'].each {|signal|
          Signal.trap(signal){ server.shutdown }
        }

# Change WEBrick :: HTTPServlet :: FileHandler to WEBrick :: HTTPServlet :: ERBHandler
# Change 'test.html' to 'test.html.erb'
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')

server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')

# Add this line
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/goya1.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya1.rb')

server.start
