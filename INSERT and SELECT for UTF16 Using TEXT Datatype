
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
	printf("zodunadb error while opening database\n"); 
	return; 
} 
BOOL result = [_db exec:@"CREATE TABLE table1 (col1 int, col2 TEXT)"]; 
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO table1 VALUES(2345, '\U0001F30D')"]; 
[_db commit];
result = [_db exec:@"SELECT col2 FROM table1"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext16:1]; 
}
[_rs resultsetrelease]; 
[_db close];
