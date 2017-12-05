# ts3-change-user-avatar-by-nickname

BACKUP TEAMSPEAK3 FOLDER AND DATABASE BEFORE USING !!!! 

First working version, tested only on 3.0.13.6 Teamspeak Server. 

<b><a href="https://github.com/cryptozealot/ts3-change-user-avatar-by-nickname/blob/master/ts3chavatar.sh">ts3chavatar.sh</a> bash script allows a linux ts3 server owner to change an user's avatar by inputing: username, picture and path to teamspeak directory as arguments. It does that by overwriting the old avatar file with the new one and editing the database to set new avatar hash for user.</b>

<br>

<b>Prerequisites:</b>
<i>sqlite3</i><p>
Install "sqlite3" with your packet manager:
<blockquote>apt-get install sqlite3</blockquote>
<blockquote>yum install sqlite3</blockquote>

<b>Parameters:</b>

<ol><li>Nickname of user</li><li>Full path of picture</li><li>Full path of ts3 directory</li></ol>

<b>Usage:</b>

Run as teamspeak user or root.

<blockquote>./ts3chavatar.sh {NICKNAME} {FULL_PATH_OF_PIC} {FULL_PATH_OF_TS3} </blockquote>

<b>Example:</b>

<blockquote>

./ts3chavatar.sh JohnDoe /home/teamspeak/upload/JohnSelfie12.jpg /home/teamspeak/

</blockquote>
<br>
That's it.

<br>
Notes : 


To Do: Get ts3 path automatically, validation, multiple servers in one db ??

<br>

sqlite3 Querries for testing:

<blockquote>
get UID

SELECT client_unique_id from clients where client_nickname='tester1';

get ID

SELECT client_id from clients where client_nickname='tester1';

set avatar md5hash

UPDATE client_properties SET value='b3b3b8e6d973385716fb320b77331f78' WHERE ident='client_flag_avatar' AND id='3689';

get md5 to input in table 

md5sum {filename}
</blockquote>
