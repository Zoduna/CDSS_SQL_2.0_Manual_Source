
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
bool result = _db->exec("ATTACH ':memory:' AS myschema"); 
result = _db->exec("CREATE TABLE myschema.table1 (col1 int, col2 varchar(100))"); 
result = _db->exec("CREATE UNIQUE INDEX idx1 ON myschema.table1 (col1)");
result = _db->exec("CREATE  INDEX idx2 ON mymschema.table1 (col2)");
_db->begintransaction(); 
result = _db->exec("INSERT INTO myschema.table1 VALUES(1234, 'abcd')"); 
result = _db->exec("INSERT INTO myschema.table1 VALUES(2345, 'efgh')"); 
_db->commit(); 
result = _db->exec("CREATE TABLE myschema.table4 AS SELECT col1, col2 FROM memschema.table1"); 
_db->close();
