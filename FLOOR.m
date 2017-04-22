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
result = [_db exec:@"SELECT FLOOR(1.2) , FLOOR(1.5), FLOOR(3), FLOOR(-1.2), FLOOR(-1.5) from dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	int1 = [_rs getint:1]; 
	int	int2 = [_rs getint:2];
	int	int3 = [_rs getint:3];
	int	int4 = [_rs getint:4];
	int	int5 = [_rs getint:5];
	printf("zodunadb test col1 = %d, col2 = %d, col3 = %d, col4 = %d, col5 = %d\n", 
		int1);
}
[_rs release];
[_db close]; 
