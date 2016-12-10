
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
bool result = _db->exec("CREATE TABLE table1 (col1 VARCHAR(100), col2 int)"); 
result = _db->exec("CREATE UNIQUE INDEX idx1 ON table1 (col2)");
_db->begintransaction(); 
result = _db->exec("INSERT INTO table1 VALUES('abcd', 17)"); 
result = _db->exec("INSERT INTO table1 VALUES('efgh', 19)"); 
result = _db->exec("INSERT INTO table1 VALUES('mnop', 14)"); 
result = _db->exec("UPDATE OR REPLACE table1 SET col1 = 'test', col2 = 55 WHERE col2 > 20"); 
_db->commit(); 
result = _db->exec("SELECT col2, col1 FROM table1"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	int	   int1 = _rs->getint(1);
	string    text1 = _rs->gettext(2); 
	printf("zodunadb test col1 = %d, col2 = %s\n", 
		int1, text1.c_str());
}
_rs->release();
_db->close();
