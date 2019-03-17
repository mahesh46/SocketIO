var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var port = process.env.PORT || 3000;
var fs = require('fs');

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket) {
    console.log('a user connected');
    socket.on('disconnect', function() {
        console.log('user disconnected');
    });
    socket.on('chat message', function(msg) {
        io.emit('chat message', msg);
    });
    //message
    socket.on('message', function(message) {
        io.emit('message', message);
        console.log('message:' + message);
    });
    //send data to client
    setInterval(function() {
        socket.emit('date', { 'date': new Date() });
    }, 1000);

    //base64
    socket.on("base64", function(base64) {
        io.emit('base64', base64);
        console.log("base64");
        var base64Str = base64;
        var buff = Buffer.from(base64Str, "base64");
        //var buff = new Buffer(base64Str ,"base64");
        //var buff = new Buffer.alloc(500000); //Bytes
        fs.writeFileSync("signature.png", buff)
    });

});

http.listen(port, function() {
    console.log('listening on *:' + port);
});