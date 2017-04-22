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
BOOL result = [_db exec:@"CREATE table t1 (col1 int, col2 varchar(10))"]; 
result = [_db exec:@"CREATE table t2 (col1 int, col2 varchar(10))"];

[_db begintransaction]; 
result = [_db exec:@"INSERT into t1 values (22, 'mmmmmm1')"];
result = [_db exec:@"INSERT into t1 values (11, 'mmmmmm2')"];
result = [_db exec:@"INSERT into t2 (col1, col2) values (55, NULL)"];
result = [_db exec:@"INSERT into t2 values (33, 'pppppp1')"];
result = [_db exec:@"INSERT into t2 values (44, 'pppppp2')"];
result = [_db exec:@"INSERT into t2 values (44, 'wwwww1')"];
result = [_db exec:@"INSERT into t2 values (66, 'wwwww2')"];
result = [_db exec:@"INSERT into t1 values (66, 'mmmmmm3')"];
[_db commit]; 
result = [_db exec:@"SELECT t2.col2, count(t2.col1) from t1, t2 where t1.col1 = 22 group by t2.col2"];
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:2]; 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs release];
result = [_db exec:@"SELECT t2.col2, count(t2.col1) from t1, t2 group by t2.col2 having count(t2.col1) = 2"];
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:2]; 
	NSString*    text1 = [_rs gettext:1]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs release];
[_db close];
