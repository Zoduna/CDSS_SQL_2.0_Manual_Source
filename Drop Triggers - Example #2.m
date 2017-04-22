//following should be used as include
#include "ZodunaDBOO_Database.h"
#include "ZodunaDBOO_ResultSet.h"
#include "ZodunaDBOO_Statement.h"

//following should be used in the method where a DataStore is to be accessed
ZodunaDBOO_Database* _db; 
ZodunaDBOO_ResultSet* _rs; 
ZodunaDBOO_Statement* _stmt; 
_db = [ZodunaDBOO_Database databaseWithPath:@"testfolder/"]; 
BOOL isOpen = [_db open]; //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	printf("zodunadb error while opening DataStore\n"); 
	return; 
}
BOOL result = [_db exec:@"CREATE DATABASE db1"]; 
result = [_db exec:@"CREATE SCHEMA db1.test1"]; 
result = [_db exec:@"ATTACH db1.test1 AS test"]; 
result = [_db exec:@"CREATE TABLE test.table1 (col1 int, col2 VARCHAR(100))"]; 
result = [_db exec:@"CREATE TABLE test.table2(col1 int, col2 VARCHAR(100))"]; 
result = [_db exec:@"CREATE UNIQUE INDEX test.idx1 ON table1 (col1)"];
result = [_db exec:@"CREATE TRIGGER test.trig1 BEFORE INSERT ON table1 BEGIN INSERT INTO table2 VALUES(new.col1, new.col2); END"];
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO test.table1 VALUES(1234, 'abcd')"]; 
result = [_db exec:@"INSERT INTO test.table1 VALUES(2345, 'efgh')"]; 
[_db commit]; 
result = [_db exec:@"SELECT col1, col2 FROM test.table1 WHERE col1 = 1234"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:1]; 
	NSString*    text1 = [_rs gettext:2]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs release];
result = [_db exec:@"DROP TRIGGER test.trig1"]; 
[_db close];
