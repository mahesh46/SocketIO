
//start node server
cd chatServer-simple
node app.json   //to install node modules (normally file is called package.json when you use node init, then node install --save)
node index.js   //to start server
//in browser (use multiple instances)
localhost:3000

// type message and press send, you should see message in the open windows
// run socketIOClient_example in xcode simulator

// type message in simulator and press button to send (1st field nickname, send for message)
// you should see message in the open browsers
// put in a signature then send signature
// you should see signature in the open chat browsers


A char, however, is only one byte. ... If you send a char over a socket, it will be one byte on both machines. If you send an int over a socket, since it's four bytes, it's possible that one machine will interpret the bytes in a different order than the other, according to the endianness.


When handling binary data transmitted or shared across platforms, you need be concerned with how each platform stores numerical values. A platform stores values either in big-endian or little-endian format. On big-endian machines, such as PowerPC machines, values are stored with the most-significant bytes first in memory; on little-endian machines, such as Pentium machines, values are stored with the least-significant bytes first. A multibyte value transmitted to a platform with a different format will be misinterpreted if it is not converted properly by one of the computers.

You identify the native format of the current platform using the CFByteOrderGetCurrent()function. Use functions such as CFSwapInt32BigToHost(_:) and CFConvertFloat32HostToSwapped(_:) to convert values between different byte order formats.


func CFByteOrderGetCurrent() -> CFByteOrder
Returns the byte order of the current computer.
func CFConvertDoubleHostToSwapped(Double) -> CFSwappedFloat64
Converts a 64-bit double from the host’s native byte order to a platform-independent format.
func CFConvertDoubleSwappedToHost(CFSwappedFloat64) -> Double
Converts a 64-bit double from a platform-independent format to the host’s native byte order.
func CFConvertFloat32HostToSwapped(Float32) -> CFSwappedFloat32
Converts a 32-bit float from the host’s native byte order to a platform-independent format.
func CFConvertFloat32SwappedToHost(CFSwappedFloat32) -> Float32
Converts a 32-bit float from a platform-independent format to the host’s native byte order.
func CFConvertFloat64HostToSwapped(Float64) -> CFSwappedFloat64
Converts a 64-bit float from the host’s native byte order to a platform-independent format.
func CFConvertFloat64SwappedToHost(CFSwappedFloat64) -> Float64
Converts a 64-bit float from a platform-independent format to the host’s native byte order.
func CFConvertFloatHostToSwapped(Float) -> CFSwappedFloat32
Converts a 32-bit float from the host’s native byte order to a platform-independent format.
func CFConvertFloatSwappedToHost(CFSwappedFloat32) -> Float
Converts a 32-bit float from a platform-independent format to the host’s native byte order.
func CFSwapInt16(UInt16) -> UInt16
Swaps the bytes of a 16-bit integer.
func CFSwapInt16BigToHost(UInt16) -> UInt16
Converts a 16-bit integer from big-endian format to the host’s native byte order.
func CFSwapInt16HostToBig(UInt16) -> UInt16
Converts a 16-bit integer from the host’s native byte order to big-endian format.
func CFSwapInt16HostToLittle(UInt16) -> UInt16
Converts a 16-bit integer from the host’s native byte order to little-endian format.
func CFSwapInt16LittleToHost(UInt16) -> UInt16
Converts a 16-bit integer from little-endian format to the host’s native byte order.
func CFSwapInt32(UInt32) -> UInt32
Swaps the bytes of a 32-bit integer.
func CFSwapInt32BigToHost(UInt32) -> UInt32
Converts a 32-bit integer from big-endian format to the host’s native byte order.
func CFSwapInt32HostToBig(UInt32) -> UInt32
Converts a 32-bit integer from the host’s native byte order to big-endian format.
func CFSwapInt32HostToLittle(UInt32) -> UInt32
Converts a 32-bit integer from the host’s native byte order to little-endian format.
func CFSwapInt32LittleToHost(UInt32) -> UInt32
Converts a 32-bit integer from little-endian format to the host’s native byte order.
func CFSwapInt64(UInt64) -> UInt64
Swaps the bytes of a 64-bit integer.
func CFSwapInt64BigToHost(UInt64) -> UInt64
Converts a 64-bit integer from big-endian format to the host’s native byte order.
func CFSwapInt64HostToBig(UInt64) -> UInt64
Converts a 64-bit integer from the host’s native byte order to big-endian format.
func CFSwapInt64HostToLittle(UInt64) -> UInt64
Converts a 64-bit integer from the host’s native byte order to little-endian format.
func CFSwapInt64LittleToHost(UInt64) -> UInt64
Converts a 64-bit integer from little-endian format to the host’s native byte order.
Data Types

struct CFSwappedFloat32
Structure holding a 32-bit float value in a platform-independent byte order.

struct CFSwappedFloat64
Structure holding a 64-bit float value in a platform-independent byte order.





