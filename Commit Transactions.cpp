
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
result = _db->exec("SELECT * FROM table1"); 
_rs = _db->getresultset(); 
while (_rs->getnext() == ZodunaDB_Constants::ZODUNADB_ROW) 
{ 
	int        column_type = _rs->getcolumntype(1);
	string    column_name = _rs->getcolumnname(1); 
	int        column_type_2 = _rs->getcolumntype(2);
	string    column_name_2 = _rs->getcolumnname(2); 

	int        int1 = _rs->getint(1);
	string    text1 = _rs->gettext(2); 
	printf("zodunadb test column 1.... type = %d, name = %s, intvalue = %d\n", 
		column_type, column_name.c_str(), int1); 
	printf("zodunadb test column 2.... type = %d, name = %s, textvalue = %s\n", 
	column_type_2, column_name_2.c_str(), text1.c_str()); 
}
_rs->release();
_db->close(); 
