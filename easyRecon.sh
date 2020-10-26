#!/bin/bash

echo "   
          ======  ======   ========  \       /
	  |      |      |        /    \     /
	  |      |      |       /      \   /
	  ===    |===== |      /         \/    RECON
	  |	 |      |    /          /
	  |	 |      |  /           /
	  ======           =========  /
         
                                        by @cspshivam
                                        https://www.cspshivam.com
                                                      	  "
domain=$1
echo "[-] EasyRecon will gather the following information for you
      [+] All existing domains of $domain
      [+] All Live domains of $domain
      [+] All URLs/Links of $domain
      [+] All JS files of $domain
                                               "
echo "	"
echo " This will take some time. You can have a cup of coffee"
echo "	"
echo "	"

mkdir $domain

echo "Enumerating subdomains with SubFinder..."
subfinder -d $domain -silent > $domain/all-domains.txt

echo $domain >> $domain/all-domains.txt
echo "[- Task Done -] All domains of $domain are saved in all-domains.txt"

sleep 1 # wait for 1 second
echo "	"
echo "Checking for LIVE domains...
	This will take approx 1 minutes...."

cat $domain/all-domains.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ":443" > $domain/live-domains.txt

echo "[- Task done -] Results are saved in live-domains.txt"

echo "	"
echo " Fetching all URLs/links of $domain...
	This will take some time.."
cat $domain/live-domains.txt | waybackurls > $domain/urls.txt
echo "[- Task Done -] All urls/links of $domain are saved in urls.txt"

echo "	"
echo "Enumerating all JS files from $domain..
       This will take approx 1 minute"
cat $domain/urls.txt | grep "\.js" | uniq | sort > $domain/js-files.txt
echo "[- Task Done -] Js files of $domain are saved in js-files.txt"

echo "	"
echo "~ All files are saved in $domain directory
			Happy Hacking :)"

