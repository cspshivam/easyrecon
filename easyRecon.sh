#!/bin/bash

echo -e "\e[96m   
          ======  ======   ========  \       /
	  |      |      |        /    \     /
	  |      |      |       /      \   /
	  ===    |===== |      /         \/    RECON
	  |	 |      |    /          /
	  |	 |      |  /           /
	  ======           =========  /
         
                                        by @cspshivam
                                        https://www.cspshivam.tk
                                                      	\e[0m"
domain=$1
if [[ -z $domain ]]; then
	echo -e "Usage: ./easyRecon.sh <domain.com>"
	exit 1
fi
echo -e "\e[91m[-] EasyRecon will gather the following information for you\e[0m"
echo -e "\e[34m[+]\e[0mAll existing domains of $domain"
echo -e "\e[34m[+]\e[0mAll Live domains of $domain"
echo -e "\e[34m[+]\e[0mAll URLs/Links of $domain"
echo -e "\e[34m[+]\e[0mAll JS files of $domain"
echo "	"
echo -e "\e[41m This will take some time. You can have a cup of coffee \e[0m"
echo "	"
echo "	"

mkdir $domain

echo -e "\e[93mEnumerating subdomains with SubFinder...\e[0m"
subfinder -d $domain -silent > $domain/all-domains.txt

echo $domain >> $domain/all-domains.txt
echo -e "[- Task Done -] \e[92mAll domains of $domain are saved in all-domains.txt\e[0m"

sleep 1 # wait for 1 second
echo "	"
echo -e "\e[93mChecking for LIVE domains, this may take some time.\e[0m"

cat $domain/all-domains.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ":443" > $domain/live-domains.txt

echo -e "[- Task done -] \e[92mResults are saved in live-domains.txt\e[0m"

echo "	"
echo -e "\e[93mFetching all URLs/links of $domain, this may take some time..\e[0m"
cat $domain/live-domains.txt | waybackurls | sort -u > $domain/urls.txt
echo -e "[- Task Done -] \e[92mAll urls/links of $domain are saved in urls.txt\e[0m"

echo "	"
echo -e "\e[93mEnumerating all JS files from $domain, this may take some time\e[0m"
cat $domain/urls.txt | grep "\.js" | uniq | sort > $domain/js-files.txt
echo -e "[- Task Done -] \e[92mJs files of $domain are saved in js-files.txt\e[0m"

echo "	"
echo -e "\e[95m~ All files are saved in $domain directory\e[0m"
echo -e "\e[5m			Happy Hacking :)\e[0m"
