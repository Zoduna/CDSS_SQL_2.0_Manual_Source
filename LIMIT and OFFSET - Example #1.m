
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
BOOL result = [_db exec:@"CREATE table t1 (col1 int, col2 varchar(10))"]; 
result = [_db exec:@"CREATE table t2 (col1 int, col2 varchar(10))"];

[_db begintransaction]; 
result = [_db exec:@"INSERT into t1 values (44, 'mmmmmm4')"];
result = [_db exec:@"INSERT into t1 values (55, 'mmmmmm5')"];
result = [_db exec:@"INSERT into t1 values (11, 'mmmmmm1')"];
result = [_db exec:@"INSERT into t1 values (22, 'mmmmmm2')"];
result = [_db exec:@"INSERT into t1 values (33, 'mmmmmm3')"];
result = [_db exec:@"INSERT into t1 values (66, 'mmmmmm6')"];
[_db commit]; 
result = [_db exec:@"SELECT col2, col1 FROM t1 LIMIT 2"];
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:2]; 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs resultsetrelease];
result = [_db exec:@"SELECT col2, col1 FROM t1 ORDER BY col1 LIMIT 2 OFFSET 2"];
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:2]; 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs resultsetrelease];
[_db close];
