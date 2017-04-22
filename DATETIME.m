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
BOOL result = [_db exec:@"CREATE TABLE table1 (col1 int, col2 varchar(100))"]; 
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO table1 VALUES(1234, 'abcd')"]; 
result = [_db exec:@"INSERT INTO table1 VALUES(2345, 'efgh')"]; 
[_db commit]; 
result = [_db exec:@"SELECT DATETIME('2010-12-31 01:00:00', '86400 seconds', '1440 minutes', '24 hours') from dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %s\n", 
		[text1 UTF8String]);
}
[_rs release];
result = [_db exec:@"SELECT DATETIME('2010-12-31 01:00:00', '-86400 seconds', '-1440 minutes', '-24 hours') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %s\n", 
		[text1 UTF8String]);
}
[_rs release];
result = [_db exec:@"SELECT DATETIME('2010-12-31 01:00:00', 'start of month') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %s\n", 
		[text1 UTF8String]);
}
[_rs release];
result = [_db exec:@"SELECT DATETIME('now', '+86400 seconds', '+1440 minutes', '+24 hours') from dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %s\n", 
		[text1 UTF8String]);
}
[_rs release];
[_db close]; 
