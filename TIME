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
bool result = _db->exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"); 
_db->begintransaction(); 
result = _db->exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db->exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db->commit(); 
result = _db->exec("SELECT TIME('23:23:23') from dumtab"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	string    text1 = _rs->gettext(1); 
	printf("zodunadb test col1 = %s\n", 
		text1.c_str());
}
_rs->release();
result = _db->exec("SELECT TIME('23:23:23', 'start of day') from dumtab"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	string    text1 = _rs->gettext(1); 
	printf("zodunadb test col1 = %s\n", 
		text1.c_str());
}
_rs->release();
result = _db->exec("SELECT TIME('23:23:23', '1 seconds', '2 minutes', '1 hours') from dumtab"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	string    text1 = _rs->gettext(1); 
	printf("zodunadb test col1 = %s\n", 
		text1.c_str());
}
_rs->release();
result = _db->exec("SELECT TIME('23:23:23', '-1 seconds', '-2 minutes', '-1 hours') from dumtab"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	string    text1 = _rs->gettext(1); 
	printf("zodunadb test col1 = %s\n", 
		text1.c_str());
}
_rs->release();
_db->close(); 
