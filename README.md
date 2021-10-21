# Nimap

## But, why ?
Nimap is a personal project heavily inspired from the amazing NimScan project from elddy (https://github.com/elddy/NimScan). This is an educational project to create a Nmap-like port scanner for penetration tests.

## Should I use it?
You can, but you probably should not. NimScan and Nmap are projects that are way more stable for real world engagements.

## Linux

### Quick start

In order to compile the project, install the Nim language:
```
sudo apt install nim
```

```
git clone https://github.com/Nariod/Nimap.git
cd Nimap/
nim c /src/main.nim Nimap.elf
```

## Todo list
- [x] Linux support
- [ ] UDP port scan support
- [ ] Windows support  
- [ ] File export support
- [ ] Ping sweep support
