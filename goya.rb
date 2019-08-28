# Launch CGI program to receive and return data
require 'cgi'
cgi = CGI.new

# After receiving data, return a response in HTML format
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # Retrieve the data of "goya" which is the mark of information by the description cgi ['goya'] and assign it to a local variable
  get = cgi['goya']

  # Return the response in HTML
  "<html>
    <body>
      <p>The size of the bitter gourd and the information of the buyer are as follows</p>
      String：#{get}
      <button> <a href='/test' >back</button>
    </body>
  </html>"
}