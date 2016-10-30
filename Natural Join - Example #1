
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
BOOL result = [_db exec:@"CREATE table table1 (col1 int)"]; 
result = [_db exec:@"CREATE table table2 (col1 int)"];
result = [_db exec:@"CREATE INDEX idx1 ON table1(col1)"];
result = [_db exec:@"CREATE INDEX idx2 ON table2(col2)"];
[_db begintransaction]; 
result = [_db exec:@"INSERT into table1 values (5)"];
result = [_db exec:@"INSERT into table1 values (7)"];
result = [_db exec:@"INSERT into table1 values (9)"];
result = [_db exec:@"INSERT into table1 values (11)"];
result = [_db exec:@"INSERT into table1 values (15)"];
result = [_db exec:@"INSERT into table2 values (3)"];
result = [_db exec:@"INSERT into table2 values (5)"];
result = [_db exec:@"INSERT into table2 values (11)"];
result = [_db exec:@"INSERT into table2 values (17)"];
result = [_db exec:@"INSERT into table2 values (19)"];
[_db commit]; 
result = [_db exec:@"SELECT a.col1, b.col1 FROM table1 AS a NATURAL JOIN table2 b"];
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:1]; 
	int	   int2 = [_rs getint:2]; 
	printf("zodunadb test col1 = %d, col2 = %d\n", 
		int1, int2);
}
[_rs resultsetrelease];
[_db close];
