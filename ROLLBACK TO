
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
result = [_db exec:@"SAVEPOINT savepoint1"]; 
result = [_db exec:@"INSERT INTO table1 VALUES(4567, 'mnop')"]; 
result = [_db exec:@"ROLLBACK TO savepoint1"];
[_db commit]; 
result = [_db exec:@"SELECT * FROM table1"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int        column_type = [_rs getcolumntype: 1]; 
	NSString*    column_name = [_rs getcolumnname:1]; 
	int        column_type_2 = [_rs getcolumntype: 2]; 
	NSString*    column_name_2 = [_rs getcolumnname:2]; 

	int        int1 = [_rs getint:1]; 
	NSString*    text1 = [_rs gettext:2]; 
	printf("zodunadb test column 1.... type = %d, name = %s, intvalue = %d\n", 
		column_type, [column_name UTF8String], int1); 
	printf("zodunadb test column 2.... type = %d, name = %s, textvalue = %s\n", 
	column_type_2, [column_name_2 UTF8String], [text1 UTF8String]); 
}
[_rs resultsetrelease];
[_db close]; 
