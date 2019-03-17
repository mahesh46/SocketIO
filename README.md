# SocketIO
Node Server, Express Web page and IOS Swift Application using Sockets - Chat example 

chat example, with node server, web interface, and ios app interface. All communicating through sockets.

//start node server
cd chatServer-simple
node app.json   //to install node modules (normally file is called package.json when you use node init, then node install --save)
node index.js   //to start server

//in browser (use multiple instances)
localhost:3000
// type message and press send, you should see message in the open windows

//ios app
// run socketIOClient_example in xcode simulator
// type message in simulator and press button to send (1st field nickname, send for message)

// you should see message in the open browsers
// put in a signature then send signature
// you should see signature in the open chat browsers

