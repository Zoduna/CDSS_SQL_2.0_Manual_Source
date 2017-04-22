
//following should be used as include
#include "ZodunaDBSQL_Database.h"



//following should be used in the method where a DataStore is to be accessed
ZodunaDBSQL_Database* _db;
ZodunaDBSQL_ResultSet*	_rs;
ZodunaDBSQL_Statement*	_stmt;

 
 
_db = new ZodunaDBSQL_Database("testfolder/");
bool isOpen = _db->open("", ""); //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	printf("zodunadb error while opening DataStore\n"); 
	return; 
}
bool result = _db->exec("CREATE TABLE table1 (col1 VARCHAR(100), col2 int ON CONFLICT IGNORE)"); 
result = _db->exec("CREATE UNIQUE INDEX idx1 ON table1 (col2)");
result = _db->exec("CREATE TABLE table2 (col1 VARCHAR(100), col2 int ON CONFLICT ROLLBACK)"); 
result = _db->exec("CREATE UNIQUE INDEX idx2 ON table2 (col2)");
result = _db->exec("CREATE TABLE table3 (col1 VARCHAR(100), col2 int ON CONFLICT REPLACE)"); 
result = _db->exec("CREATE UNIQUE INDEX idx3 ON table3 (col2)");
result = _db->exec("CREATE TABLE table4 (col1 VARCHAR(100), col2 int ON CONFLICT ABORT)"); 
result = _db->exec("CREATE UNIQUE INDEX idx4 ON table4 (col2)");
result = _db->exec("CREATE TABLE table5 (col1 VARCHAR(100), col2 int ON CONFLICT FAIL)"); 
result = _db->exec("CREATE UNIQUE INDEX idx5 ON table5 (col2)");
_db->begintransaction();
result = _db->exec("INSERT INTO table1 VALUES('abcd', 17)"); 
result = _db->exec("INSERT INTO table1 VALUES('efgh', 19)"); 
result = _db->exec("INSERT INTO table1 VALUES('mnop', 14)"); 
_db->commit();
result = _db->exec("SELECT col2, col1 FROM table1"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	int	   int1 = _rs->getint(1); 
	char*    text1 = _rs gettext(2); 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, text1);
}
_rs->resultsetrelease();
_db->close();
