var http = require("http");

var fs = require('fs');
var port = 8081;
var serverUrl = "localhost";
var counter = 0;
var pageMeta = require("./pageMetaData");

var server = http.createServer(function(req, res) {

  var setPageData = function (contenttype, src){

    var pageMetaData;

    pageMetaData = pageMeta();
    pageMetaData.contentType = contenttype;
    pageMetaData.src = src;

    return pageMetaData;

  }

  var pageData;

  console.log("Request: " + req.url + " (" + counter + ")");

  switch (req.url) {

    case "/favicon.ico" :
      break;

    case "/index.css" :
      pageData = setPageData("text/css", "index.css");
      break;

    default:
      pageData = setPageData("text/html", "index.html");

  }

  if (req.url != "/favicon.ico"){
    
    fs.readFile(pageData.src, function(err, text){

      res.setHeader("Content-Type", pageData.contentType);

      res.end(text);
    })
  };


  return;

});

console.log("Starting web server at " + serverUrl + ":" + port);
server.listen(port, serverUrl);