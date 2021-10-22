import std/net
import os

proc isOpenUdp*(targetIp: string, port: int, timeout: int) {.thread} =
    let socket = newSocket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)
    try:
        socket.sendTo(targetIp, Port(port), "status\n")
        sleep(timeout)
        if 1==2:
          echo("UDP ",targetIp,":",port)
        else:
          discard
    except:
        discard

when isMainModule:
  #let socket = newSocket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)
  #socket.sendTo("192.168.1.254", Port(123), "status\n")
  for port in 123..125:
    isOpenUdp("192.168.1.254", port, 250)
  sleep(5000)
