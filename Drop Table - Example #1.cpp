
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
bool result = _db->exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))"); 
result = _db->exec("CREATE UNIQUE INDEX idx1 ON table1 (col1)");
result = _db->exec("CREATE  INDEX idx2 ON table1 (col2)");
result = _db->exec("CREATE TABLE table2 AS SELECT col1, col2 FROM table1"); 
_db->begintransaction();
result = _db->exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db->exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db->commit();
result = _db->exec("SELECT col1, col2 FROM table1 WHERE col1 = 1234"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	int	   int1 = _rs->getint(1); 
	char*    text1 = _rs gettext(2); 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, text1);
}
_rs->resultsetrelease();
result = _db->exec("DROP TABLE table1"); 
_db->close();
