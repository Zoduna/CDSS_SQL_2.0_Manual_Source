
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
bool result = _db->exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"); 
_db->begintransaction();
result = _db->exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db->exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db->commit();
result = _db->exec("SELECT POW(2, 3), POW(2, -3), POW(2, 0), POW(2, 3.2), POW(2, -3.2) from dumtab ");

_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	double	d1 =_rs->getdouble(1); 
	double	d2 =_rs->getdouble(2); 
	double	d3 =_rs->getdouble(3); 
	double	d4 =_rs->getdouble(4); 
	double	d5 =_rs->getdouble(5); 
	printf("zodunadb test col1 = %f., col2 = %f, col3 = %f, col4 = %f, col5 = %f\n", 
		d1, d2, d3, d4, d5);
}
_rs->resultsetrelease();
_db->close(); 
