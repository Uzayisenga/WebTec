require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya1']
  "<html>
    <body>
      <p>The size of the bitter gourd and the information when quality is false:</p>
      String：#{get}
      <button> <a href='/test' >back</button>
    </body>
  </html>"
}