
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
BOOL result = [_db exec:@"CREATE TABLE oldcustomers(col1 int, col2 int, col3 int, col4 int, col5 int, col6 VARCHAR(100))"];
result = [_db exec:@"CREATE TABLE Customers(col1 int, col2 int, col3 int, col4 int, col5 int, col6 VARCHAR(100))"];
result = [_db exec:@"CREATE UNIQUE INDEX idx1 ON oldcustomers (col1)"];
result = [_db exec:@"CREATE UNIQUE INDEX idx2 ON Customers(col1)"];
result = [_db exec:@"CREATE TABLE table1 (col1 int, col2 VARCHAR(100))"];
[_db begintransaction]; 
result = [_db exec:@"INSERT INTO oldcustomers (1, 2, 3, 4, 5, 'abcd')"]; 
result = [_db exec:@"INSERT INTO oldcustomers (2, 3, 4, 5, 6, 'bcde')"]; 
result = [_db exec:@"INSERT INTO Customers (1, 2, 3, 4, 5, 'abcd')"];
result = [_db exec:@"INSERT OR IGNORE INTO Customers AS SELECT col1, col2, col3, col4, col5, col6 FROM oldcustomers"]; 
[_db commit]; 
result = [_db exec:@"SELECT col1, col2 FROM table1 WHERE col1 = 1234"]; 
_rs = [_db getresultset]; 
while ([_rs getnext] == ZODUNADB_ROW) 
{ 
	int	   int1 = [_rs getint:1]; 
	NSString*    text1 = [_rs gettext:2]; 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, [text1 UTF8String]);
}
[_rs resultsetrelease];
[_db close];
