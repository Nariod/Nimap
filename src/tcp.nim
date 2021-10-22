import std/net

proc isOpenTcp*(targetIp: string, port: int, timeout: int) {.thread} =
    var socket = newSocket()
    try:
        socket.connect(targetIp, Port(port), timeout)
        echo("TCP ",targetIp,":",port)
    except:
        discard
    finally:
        try:
            socket.close()
        except:
            discard
