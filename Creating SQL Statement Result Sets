
//following should be used as include
#include "ZodunaDBSQL_Database.h"
#include "ZodunaDBSQL_ResultSet.h"
#include "ZodunaDBSQL_Statement.h"

//following should be used in the method where DataStore is to be accessed
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
result = [_db exec:@"CREATE VIEW view1 AS SELECT col1 FROM table1"]; 
result = [_db exec:@"CREATE VIEW view2 AS SELECT col1 + 1000 AS 'newcol1' FROM table1"]; 
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO table1 VALUES(1234, 'abcd')"]; 
result = [_db exec:@"INSERT INTO table1 VALUES(2345, 'efgh')"]; 
[_db commit]; 
_stmt = [_db execquery:@"SELECT * FROM view1"]; 
_rs = [_stmt getresultset];
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test column 2.... textvalue = %s\n",  [text1 UTF8String]); 
}
[_rs resultsetrelease];
_stmt = [_db execquery:@"SELECT * FROM view2"]; 
_rs = [_stmt getresultset];
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test column 2.... textvalue = %s\n",  [text1 UTF8String]); 
}
[_rs resultsetrelease];
[_db close]; 
