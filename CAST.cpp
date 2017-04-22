
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
bool result = _db->exec("CREATE TABLE table1 (col1 long, col2 varchar(100))"); 
_db->begintransaction();
result = _db->exec("INSERT INTO table1 VALUES(542, '225.567')"); 
_db->commit();
result = _db->exec("SELECT CAST(col1, "byte") AS 'col1' from table1"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	int	int1 = _rs->getint(1); 
	printf("zodunadb test col1 = %d\n", 
		int1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT CAST(col2, "int") AS 'col1' from table1");
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	int	int1 = _rs->getint(1); 
	printf("zodunadb test col1 = %d\n", 
		int1);
}
_rs->resultsetrelease();
_db->close(); 
