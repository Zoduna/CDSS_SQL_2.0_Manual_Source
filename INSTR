
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
BOOL result = [_db exec:@"CREATE TABLE table1 (col1 int, col2 varchar(100))"]; 
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO table1 VALUES(1234, 'abcd')"]; 
result = [_db exec:@"INSERT INTO table1 VALUES(2345, 'efgh')"]; 
[_db commit]; 
result = [_db exec:@"SELECT INSTR('abcdef', 'bc'), INSTR('abcdef', 'xy')  from dumtab "]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int		var1 = [_rs getint:1]; 
	int		var2 = [_rs getint:2]; 
	printf("zodunadb test col1 = %d, col2 = %d\n", 
		var1, var2);
}
[_rs resultsetrelease];
[_db close]; 
