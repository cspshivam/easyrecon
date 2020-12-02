# EasyRecon
 
![alt text](https://github.com/cspshivam/easyrecon/blob/main/easy.JPG "easyrecon")

# EasyRecon is a script that do the initial reconnaissance of target automatically. To scan Google, simply run $ ./easyRecon.sh google.com


# Setup
 To install EasyRecon, clone this repository. EasyRecon relies on a couple of tools to be installed so make sure you have them:
    
 * [subfinder](https://github.com/projectdiscovery/subfinder)
 * [httprobe](https://github.com/tomnomnom/httprobe)
 * [waybackurls](https://github.com/tomnomnom/waybackurls)
 
 please make sure that as most of these tools are written in Go, that you have Go installed and configured properly. Make sure that when you type any of the above commands in the terminal, they are recognized and work.
 
# Installation
```console
$ git clone https://github.com/cspshivam/easyrecon.git
$ cd easyrecon
$ chmod +x easyRecon.sh
$ ./easyRecon.sh
```

# Usage
 ```console
$ ./easyRecon.sh example.com
```
# Features
* Enumerate all the existing domains with subfinder
* Seperate live domains from all existing domains httprobe
* Spider the target and save all the URLS of target using waybackurls
* grep all the js files and endpoints from the target

# EasyRecon Working
![alt text](https://github.com/cspshivam/easyrecon/blob/main/.working-pic-easyrecon.png "easyrecon-working")
