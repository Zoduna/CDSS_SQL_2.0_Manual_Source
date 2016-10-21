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
result = [_db exec:@"CREATE TABLE test.table1 (col1 int DEFAULT 99999, col2 VARCHAR(100) DEFAULT 'abcd')"]; 
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO test.table1 (col1, col2) VALUES(1234, 'abcd')"]; 
result = [_db exec:@"INSERT INTO test.table1 (col2, col1) VALUES('efgh', 2345)"]; 
result = [_db exec:@"INSERT INTO test.table1 DEFAULT VALUES"]; 
[_db commit]; 
result = [_db exec:@"SELECT col1, col2 FROM table1 WHERE col1 = 1234"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:1]; 
	NSString*    text1 = [_rs gettext:2]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs release];
[_db close];
