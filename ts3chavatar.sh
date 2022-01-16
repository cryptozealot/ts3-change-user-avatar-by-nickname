#!/bin/bash
# Input parameters
nickname=$1
picpath=$2
tspath=$3

#Get UID and ID from database by nickname
uid=`sqlite3 -batch $tspath/ts3server.sqlitedb "SELECT client_unique_id from clients where client_nickname='$nickname';"`
id=`sqlite3 -batch $tspath/ts3server.sqlitedb "SELECT client_id from clients where client_nickname='$nickname';"`

#Generate avatar filename: base64 decode, hexdump, cut last two, replace letter by letter
b64decodeduid=`base64 -d <<< $uid`
hexuid=`xxd -p <<< $b64decodeduid`
hexuid=${hexuid:0:40}
result=`echo $hexuid | tr 'a' 'k' | tr 'b' 'l' | tr 'c' 'm' | tr 'd' 'n' | tr 'e' 'o' | tr 'f' 'p'`
result=`echo $result | tr '0' 'a' | tr '1' 'b' | tr '2' 'c' | tr '3' 'd' | tr '4' 'e' | tr '5' 'f' | tr '6' 'g' | tr '7' 'h' | tr '8' 'i' | tr '9' 'j'`
avatarfilename="avatar_$result"
echo Avatar file is $avatarfilename

#Get MD5hash of new picture
md5hash=`md5sum  $picpath | awk '{print $1}'`
echo MD5 is $md5hash

#Replace old picture file with new pic
cp $picpath $tspath/files/virtualserver_1/internal/$avatarfilename
echo Replaced $tspath/files/virtualserver_1/internal/$avatarfilename

#Update new md5hash of new pic in database
sqlite3 -batch $tspath/ts3server.sqlitedb "UPDATE client_properties SET value='$md5hash' WHERE ident='client_flag_avatar' AND id='$id';"
