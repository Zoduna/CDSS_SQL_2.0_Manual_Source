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
result = [_db exec:@"SELECT json_array_length('[1,2,3,4]') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	int1 = [_rs getint:1]; 
	printf("zodunadb test json = %s\n", 
			int1);
}
[_rs release];
result = [_db exec:@"SELECT json_array_length('[1,2,3,4]', '$') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	int1 = [_rs getint:1]; 
	printf("zodunadb test json = %s\n", 
			int1);
}
[_rs release];
result = [_db exec:@"SELECT json_array_length('[1,2,3,4]', '$[2]') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	int1 = [_rs getint:1]; 
	printf("zodunadb test json = %s\n", 
			int1);
}
[_rs release];
result = [_db exec:@"SELECT json_array_length('{"one":[1,2,3]}') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	int1 = [_rs getint:1]; 
	printf("zodunadb test json = %s\n", 
			int1);
}
[_rs release];
result = [_db exec:@"SELECT json_array_length('{"one":[1,2,3]}', '$.one') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	int1 = [_rs getint:1]; 
	printf("zodunadb test json = %s\n", 
			int1);
}
[_rs release];
result = [_db exec:@"SELECT json_array_length('{"one":[1,2,3]}', '$.two') FROM dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	int1 = [_rs getint:1]; 
	printf("zodunadb test json = %s\n", 
			int1);
}
[_rs release];
 [_db close];
