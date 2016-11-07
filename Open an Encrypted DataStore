
//following should be used as include
#include "ZodunaDBSQL_Database.h"



//following should be used in the method where the DataStore is to be accessed
ZodunaDBSQL_Database* _db; 
 
 
int		rc = 0;

_db = new ZodunaDBSQL_Database("testfolder/");

//use createadminuser only when creating the DataStore
rc = _db->createadminuser("master"
,"master"
,1
, "key for encryption");

//used every time to create/open encrypted DataStore
bool isOpen = _db->open_encrypted("master" 
,"master" 
,1
, "key for encryption"); //returns "true" if successful and "false" if the command fails.
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
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	int        column_type = _rs->getcolumntype(1); 
	char*    column_name = _rs->getcolumnname(1); 
	int        column_type_2 = _rs->getcolumntype(2); 
	char*    column_name_2 = _rs->getcolumnname(2); 

	int        int1 = _rs->getint(1); 
	char*    text1 = _rs gettext(2); 
	printf("zodunadb test column 1.... type = %d, name = %s, intvalue = %d\n", 
		column_type, column_name, int1); 
	printf("zodunadb test column 2.... type = %d, name = %s, textvalue = %s\n", 
	column_type_2, column_name_2, text1); 
}
_rs->resultsetrelease();
_db->close();
