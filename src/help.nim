#[
    Help
]#

proc printHelp*() =
    when defined windows:
        echo """
Nimap.
Usage:
    Nimap.exe -p:<portX>-<portY> <host> [--timeout:<time>]
    Nimap.exe -p:<port> <host>
    Nimap.exe -p:<port1>,<port2>,<portN> <host>
Options:
    -h, --help            Show this screen.
    -p, --ports           Ports to scan. [default: 1-65,535]
    """

    when defined linux:
        echo """
Nimap.
Usage:
    Nimap -p:<portX>-<portY> <host> [--timeout=<time>]
    Nimap -p:<port> <host>
    Nimap -p:<port1>,<port2>,<portN> <host>
    Nimap (-h | --help)
Options:
    -h, --help            Show this screen.
    -p, --ports           Ports to scan. [default: 1-65,535]
    """
