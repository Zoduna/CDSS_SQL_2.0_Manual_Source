//following should be used as include
#include "ZodunaDBSQL_Database.h"
#include "ZodunaDBSQL_ResultSet.h"
#include "ZodunaDBSQL_Statement.h"

//following should be used in the method where DataStore is to be accessed
ZodunaDBSQL_Database* _db; 
ZodunaDBSQL_ResultSet* _rs; 
ZodunaDBSQL_Statement* _stmt; 
_db = [ZodunaDBSQL_Database databaseWithPath:@"testfolder/"];
//This is required before open_encrypted can be executed. 
[_db createadminuser:@"testfolder/"
	adminuser: @"master" 
	adminpassword: @"master"
	encryption_algorithm:ZODUNADB_ENCRYPTION_TEA
	encryptpassword:@"key for encryption" ];
BOOL isOpen = [_db open_encrypted:@"master"
password: @"master"
encryption_algorithm:ZODUNADB_ENCRYPTION_TEA 
encryptpassword:@"key for encryption"]; //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
printf("zodunadb error while opening DataStore\n"); 
return; 
}
BOOL result = [_db exec:@"CREATE DATABASE db1"]; 
result = [_db exec:@"CREATE SCHEMA db1.test1"]; 
result = [_db exec:@"ATTACH db1.test1 AS test"];
result = [_db exec:@"CREATE TABLE table1 (col1 int, col2 varchar(100))"]; 
result = [_db exec:@"CREATE UNIQUE INDEX idx1 ON table1 (col1)"];
result = [_db exec:@"CREATE INDEX idx2 ON table1 (col2)"];
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO table1 VALUES(1234, 'abcd')"]; 
result = [_db exec:@"INSERT INTO table1 VALUES(2345, 'efgh')"]; 
[_db commit]; 
result = [_db exec:@"SELECT col1, col2 FROM table1 WHERE col1 = 1234"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
int int1 = [_rs getint:1]; 
NSString* text1 = [_rs gettext:2]; 
printf("zodunadb test col1 = %d, col2 = %s\n", 
int1, [text1 UTF8String]);
}
[_rs resultsetrelease];
[_db close];
