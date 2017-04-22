
//following should be used as include
#include "zodunadboo/ZodunaDBOO_Database.h"



//following should be used in the method where a DataStore is to be accessed
ZodunaDBOO_Database* _db; 
ZodunaDBOO_ResultSet* _rs; 
ZodunaDBOO_Statement* _stmt; 
_db = new ZodunaDBOO_Database("testfolder/");
bool isOpen = _db->open(); //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	printf("zodunadb error while opening DataStore\n"); 
	return; 
}
bool result = _db->exec("CREATE DATABASE db1"); 
result = _db->exec("CREATE SCHEMA db1.test"); 
result = _db->exec("ATTACH db1.test AS test"); 
result = _db->exec("CREATE TABLE test.table1 (col1 int, col2 VARCHAR(100))"); 
result = _db->exec("CREATE  INDEX test.idx1 ON table1 (col1)");
_db->begintransaction(); 
result = _db->exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db->exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db->commit(); 
result = _db->exec("SELECT col1, col2 FROM table1 WHERE col1 = 1234"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	int	   int1 = _rs->getint(1);
	string    text1 = _rs->gettext(2); 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, text1.c_str());
}
_rs->release();

result = _db->exec("DROP INDEX test.idx1 ON table1 "); 
_db->close();
