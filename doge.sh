#!/bin/bash
clear
printf "Insert Account ID: "; read Reff
reff(){
ran=$(shuf -i 1-40 -n 1)
pin=$(shuf -i 1000-9999 -n 1)
address=$(curl "https://live.blockcypher.com/doge/" -s | grep -Po '(?<=<a href="/doge/address/)[^"]*' | sed -n "$ran"p)
signup=$(curl -s -X POST -d "wallet=$address&password=$pin&action=post&refid=$Reff" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:53.0) Gecko/20100101 Firefox/53.0" "https://dogecoins.investments/?a=4288" -e "https://web.facebook.com/" -x "$proxys" -m 10 2> /dev/null)
    if [[ $signup == "" ]]
        then
   printf "[Address: $address] [Proxy: $proxys]"
            printf " [Status: Success]\n"
         else
printf "[Address: $address] [Proxy: $proxys]"
            printf " [Status: Failed]\n"
            fi
}
for proxys in $(cat proxylist.txt)
do
reff
done
