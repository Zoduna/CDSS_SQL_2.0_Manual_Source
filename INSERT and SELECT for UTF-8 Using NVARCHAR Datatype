
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
	printf("zodunadb error while opening database\n"); 
	return; 
} 
bool result = _db->exec("CREATE TABLE table1 (col1 int, col2 NVARCHAR(100))"); 
_db->begintransaction(); 
result = _db->exec("INSERT INTO table1 VALUES(1234, '\u00E9')"); 
_db->commit();
result = _db->exec("SELECT col2 FROM table1"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	string    text1 = _rs->gettext16(1); 
}
_rs->release(); 
_db->close();
