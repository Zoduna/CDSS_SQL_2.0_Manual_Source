
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
BOOL result = [_db exec:@"CREATE TABLE table1 (col1 VARCHAR(100), col2 VARCHAR(100))"]; 
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO table1 VALUES('abcd', '1234')"]; 
result = [_db exec:@"INSERT INTO table1 VALUES('bcde', '2345')"]; 
result = [_db exec:@"INSERT INTO table1 VALUES('cdef', '3456')"]; 
[_db commit]; 
result = [_db exec:@"SELECT json_group_object(col1, col2) FROM table1"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test json = %s\n", 
		[text1 UTF8String]);
}
[_rs resultsetrelease];
[_db close]; 
