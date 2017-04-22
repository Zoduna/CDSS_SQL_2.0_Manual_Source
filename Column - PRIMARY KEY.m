//following should be used as include
#include "ZodunaDBOO_Database.h"
#include "ZodunaDBOO_ResultSet.h"
#include "ZodunaDBOO_Statement.h"

//following should be used in the method where DataStore is to be accessed
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
BOOL result = [_db exec:@"CREATE TABLE table1 (col1 int NOT NULL PRIAMRY KEY, col2 VARCHAR(100))"]; 
result = [_db exec:@"CREATE TABLE table2(col1 int NOT NULL, col2 int NOT NULL, col3 VARCHAR(100), PRIMARY KEY (col1, col2))"]; 
result = [_db exec:@"CREATE TABLE table3(col1 int NOT NULL, col2 int NOT NULL, col3 VARCHAR(100), PRIMARY KEY (col1, col2) ON CONFLICT ROLLBACK)"]; 
[_db close];
