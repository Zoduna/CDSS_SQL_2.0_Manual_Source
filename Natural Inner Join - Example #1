
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
bool result = _db->exec("create table table1 (col1 int)"); 
result = _db->exec("create table table2 (col1 int)");
_db->begintransaction(); 
result = _db->exec("insert into table1 values (5)");
result = _db->exec("insert into table1 values (7)");
result = _db->exec("insert into table1 values (9)");
result = _db->exec("insert into table1 values (11)");
result = _db->exec("insert into table1 values (15)");
result = _db->exec("insert into table2 values (3)");
result = _db->exec("insert into table2 values (5)");
result = _db->exec("insert into table2 values (11)");
result = _db->exec("insert into table2 values (17)");
result = _db->exec("insert into table2 values (19)");
_db->commit(); 
result = _db->exec("SELECT a.col1, b.col1 FROM table1 a NATURAL INNER JOIN table2 b");
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	int	   int1 = _rs->getint(1);
	int	   int2 = _rs->getint(2);
	printf("zodunadb test col1 = %d, col2 = %d\n", 
		int1, int2);
}
_rs->release();
_db->close();
