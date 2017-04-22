
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
result = [_db exec:@"SELECT ROUND(1, 1), ROUND(2.718, 2), ROUND(2.713, 2), ROUND(-5.339, 2), ROUND(-5.333, 2) from dumtab"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	double	d1 = [_rs getdouble:1]; 
	double	d2 = [_rs getdouble:2]; 
	double	d3 = [_rs getdouble:3]; 
	double	d4 = [_rs getdouble:4]; 
	double	d5 = [_rs getdouble:5]; 
	printf("zodunadb test col1 = %f, col2 = %f, col3 = %f, col4 = %f, col5 = %f \n", 
		d1, d2, d3, d4, d5);
}
[_rs resultsetrelease];
[_db close]; 
