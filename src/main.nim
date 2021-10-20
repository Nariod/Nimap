import net
import threadpool
import help, ip_seg
import parseopt, strutils, os, sequtils, net

# OS lib is needed for "commandLineParams"
# functional TCP port scanner
# needs to have a argument parser for real world

proc banner =
    echo("----------------------------------------")
    let banner = """
  _   _ _
 | \ | (_)
 |  \| |_ _ __ ___   __ _ _ __
 | . ` | | '_ ` _ \ / _` | '_ \
 | |\  | | | | | | | (_| | |_) |
 |_| \_|_|_| |_| |_|\__,_| .__/
                         | |
                         |_|
    """
    echo(banner)
    echo("----------------------------------------")

proc validatePort(port: int) =
    if port < 1 or port > 65535:
        quit("Not valid port number, Port range: 0 < port < 65536")

proc argParser(hosts: var seq[string], ports: var seq[int], timeout: var int) =
# thank you NimScanner !
    var p = initOptParser(commandLineParams())
    while true:
          p.next()
          case p.kind
          of cmdEnd: break
          of cmdShortOption, cmdLongOption:
            try:
                case p.key.toLower()
                of "p", "ports", "port":
                    if (p.val).contains(","):
                        for p in (p.val).split(","):
                            validatePort(p.parseInt())
                            ports.add(p.parseInt())

                    elif (p.val).contains("-"):
                        let
                            range1 = (p.val).split("-")[0].parseInt()
                            range2 = (p.val).split("-")[1].parseInt()
                        validatePort(range1)
                        validatePort(range2)
                        ports = toSeq(range1..range2)

                    else:
                        validatePort((p.val).parseInt())
                        ports.add((p.val).parseInt())
                of "timeout":
                    timeout = (p.val).parseInt()
                of "h", "help":
                    printHelp()
                    quit(-1)

            except:
              printHelp()
              quit(-1)
          of cmdArgument:
            if (p.key).contains(","):
                for p in (p.key).split(","):
                  hosts.add(p)

            elif (p.key).contains("-"):
              let
                  range1 = (p.key).split("-")[0]
                  range2 = (p.key).split("-")[1]
              if isIpAddress(range1) and isIpAddress(range2):
                  hosts = calc_range(range1, range2)
              else:
                  hosts.add(p.key)
            elif (p.key).contains("/"):
                hosts = calc_range(p.key)
            else:
                hosts.add(p.key)

    if hosts.len == 0:
        printHelp()
        quit(-1)
    ports = deduplicate(ports)


proc isOpen(targetIp: string, port: int, timeout: int) {.thread} =
    var socket = newSocket()
    try:
        socket.connect(targetIp, Port(port), timeout)
        echo(targetIp,":",port)
    except:
        discard
    finally:
        try:
            socket.close()
        except:
            discard


when isMainModule:
    var
        hosts: seq[string]
        ports: seq[int]
        timeout: int
    timeout = 500
    banner()
    argParser(hosts, ports, timeout)
    for host in hosts:
      #echo(host)
      for port in ports:
        #echo("Trying ",port)
        spawn isOpen(host, port, timeout)
    sleep(10000) #needed so the last ports can callback
