# ts3-change-user-avatar-by-nickname
This bash script allows the owner of ts3 server to change a user's avatar by providing username, picture and path to teamspeak directory.

SCRIPT IS NOT FULLY TESTED YET, BACKUP YOUR DATABASE AND AVATAR FILES BEFORE USING !!!! ESPECIALLY IF YOU HAVE MULTIPLE SERVER INSTANCES IN ONE DATABASE !!!

Teamspeak 3 functionality doesn't allow admins or owners of teamspeak3 server to change user's avatar. But I don't accept that and have written this script so you can troll your teamspeak users for fun.

ts3chavatar.sh script needs 3 input parameters in order to work:

<ul><li>nickname of user</li><li>full path of pic</li><li>full path where ts3 is installed</li></ul>

<b>USAGE:</b>

<blockquote><B>./ts3chavatar.sh {NICKNAME} {FULL_PATH_OF_PIC} {FULL_PATH_OF_TS3} </B></blockquote>

<b>EXAMPLE:</b>

<blockquote>

./ts3chavatar.sh ts3user /home/ubuntu/picture123.jpg /home/teamspeak/

</blockquote>





NOTES : 

SQL Querries:

get UID

SELECT client_unique_id from clients where client_nickname='tester1';

get ID

SELECT client_id from clients where client_nickname='tester1';

set avatar md5hash

UPDATE client_properties SET value='b3b3b8e6d973385716fb320b77331f78' WHERE ident='client_flag_avatar' AND id='3689';

get md5 to input in table 

md5sum {filename}
