#[
    Help
]#

proc printHelp*() =
    when defined windows:
        echo """
Nimap.
Usage:
    nimscan.exe -p:<portX>-<portY> <host> [--timeout:<time>]
    nimscan.exe -p:<port> <host>
    nimscan.exe -p:<port1>,<port2>,<portN> <host>
Options:
    -h, --help            Show this screen.
    -p, --ports           Ports to scan. [default: 1-65,535]
    """

    when defined linux:
        echo """
Nimap.
Usage:
    NimScan -p:<portX>-<portY> <host> [--timeout=<time>]
    NimScan -p:<port> <host>
    NimScan -p:<port1>,<port2>,<portN> <host>
    NimScan (-h | --help)
Options:
    -h, --help            Show this screen.
    -p, --ports           Ports to scan. [default: 1-65,535]
    """
