# ts3-change-user-avatar-by-nickname
This bash script allows the owner of ts3 server to change a user's avatar by username



Under development.....



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
