
//following should be used as include
#include "ZodunaDBSQL_Database.h"
#include "ZodunaDBSQL_ResultSet.h"
#include "ZodunaDBSQL_Statement.h"

//following should be used in the method where a DataStore is to be accessed
ZodunaDBSQL_Database* _db; 
ZodunaDBSQL_ResultSet* _rs; 
ZodunaDBSQL_Statement* _stmt; 
_db = [ZodunaDBSQL_Database databaseWithPath:@"testfolder/"]; 
BOOL isOpen = [_db open:NULL password:NULL]; //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	printf("zodunadb error while opening DataStore\n"); 
	return; 
}
BOOL result = [_db exec:@"CREATE DATABASE db1"]; 
result = [_db exec:@"CREATE SCHEMA db1.test"]; 
result = [_db exec:@"ATTACH db1.test AS test"]; 
result = [_db exec:@"CREATE TABLE test.table1 (col1 VARCHAR(100), col2 int)"]; 
result = [_db exec:@"CREATE UNIQUE INDEX test.idx1 ON table1 (col2)"];
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO test.table1 VALUES('abcd', 17)"]; 
result = [_db exec:@"INSERT INTO test.table1 VALUES('efgh', 19)"]; 
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop9', 114)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop8', 104)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop7', 94)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop6', 84)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop5', 74)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop4', 64)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop3', 54)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop2', 44)"];  
result = [_db exec:@"INSERT INTO test.table1 VALUES('mnop1', 34)"]; 
result = [_db exec:@"DELETE FROM test.table1 WHERE col2 > 20 ORDER BY col1 LIMIT 5"]; 
[_db commit]; 
result = [_db exec:@"SELECT col2, col1 FROM test.table1"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:1]; 
	NSString*    text1 = [_rs gettext:2]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs resultsetrelease];
[_db close];
