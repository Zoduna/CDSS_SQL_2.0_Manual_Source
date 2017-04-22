
//following should be used as include
#include "zodunadboo/ZodunaDBOO_Database.h"



//following should be used in the method where DataStore is to be accessed
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
bool result = _db->exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"); 
result = _db->exec("CREATE VIEW view1 AS SELECT col1 FROM table1"); 
result = _db->exec("CREATE VIEW view2 AS SELECT col1 + 1000 AS 'newcol1' FROM table1"); 
_db->begintransaction(); 
result = _db->exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db->exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db->commit(); 
_rs = _db->execquery("SELECT * FROM view1"); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	string    text1 = _rs->gettext(1); 
	printf("zodunadb test column 2.... textvalue = %s\n",  text1.c_str()); 
}
_rs->release();
_rs = _db->exec("SELECT * FROM view2"); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	string    text1 = _rs->gettext(1); 
	printf("zodunadb test column 2.... textvalue = %s\n",  text1.c_str()); 
}
_rs->release();
_db->close(); 
