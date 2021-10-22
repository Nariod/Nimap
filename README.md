# Nimap

## But, why ?
Nimap is a personal project to try out the Nim language. This is heavily inspired from the amazing NimScan project from elddy (https://github.com/elddy/NimScan).

## Should I use it?
You can, but you probably should not. NimScan and Nmap are tools that are way more stable for real world engagements.

## Linux

### Compilation
In order to compile Nimap, install the Nim language:
```
sudo apt install nim
```
Then, clone and compile the project:
```
git clone https://github.com/Nariod/Nimap.git
cd Nimap/
nim c -o:Nimap.elf /src/main.nim
```

### Quick start
Scanning TCP ports 80 and 443 from scanme.nmap.org with a timeout of 0,5 second:
```
./Nimap.elf -p:80,443 45.33.32.156 --timeout=500
```

## Windows
Work in progress.

## Todo list
- [x] Linux support
- [ ] UDP port scan support
- [ ] Windows support  
- [ ] File export support
- [ ] Ping sweep support
- [ ] Find another cmdline parser, damn..
