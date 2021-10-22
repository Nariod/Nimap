# Nimap

## But, why ?
Nimap is a personal project heavily (like; for real) inspired from the amazing NimScan project from elddy (https://github.com/elddy/NimScan). This is an educational project to create a Nmap-like port scanner for penetration tests.

## Should I use it?
You can, but you probably should not. NimScan and Nmap are tools that are way more stable for real world engagements.

## Linux

### Quick start

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

## Todo list
- [x] Linux support
- [ ] UDP port scan support
- [ ] Windows support  
- [ ] File export support
- [ ] Ping sweep support
