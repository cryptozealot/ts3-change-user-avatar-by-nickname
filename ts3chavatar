#!/bin/bash

# Input parameter - UID.
uid=$1

#Decode Base64 UID to HEX.
b64decodeduid=`base64 -d <<< $uid`
#Hexdump to ASCI string.
hexuid=`xxd -p <<< $b64decodeduid`

#Cut last two characters, for some reason there are 2 more characters than we need.
hexuid=${hexuid:0:40}

#Replace letters in string (probabbly there's a better and faster way, but it works :))
result=`echo $hexuid | tr 'a' 'k' | tr 'b' 'l' | tr 'c' 'm' | tr 'd' 'n' | tr 'e' 'o' | tr 'f' 'p'`

#Replace digits in string.
result=`echo $result | tr '0' 'a' | tr '1' 'b' | tr '2' 'c' | tr '3' 'd' | tr '4' 'e'  | tr '5' 'f' | tr '6' 'g' | tr '7' 'h' | tr '8' 'i' | tr '9' 'j'`

result="avatar_$result"

echo $result
