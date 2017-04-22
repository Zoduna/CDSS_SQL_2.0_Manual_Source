
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
bool result = _db->exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))"); 
result = _db->exec("CREATE UNIQUE INDEX idx1 ON table1(col1))"); 
result = _db->exec("CREATE TABLE table2 (col1 byte, col2 short, col3 int REFERENCES table2 (col1))");
result = _db->exec("CREATE TABLE table3 (col1 VARCHAR(100), col2 blob)"); 
result = _db->exec("CREATE TABLE table4 (col1 int NOT NULL, col2 VARCHAR(100), PRIMARY KEY(col1))"); 
result = _db->exec("CREATE TABLE table5 (col1 int, col2 VARCHAR(100), UNIQUE(col1))"); 
result = _db->exec("CREATE TABLE table6 (col1 int autoincrement, col2 VARCHAR(100))"); 
result = _db->exec("CREATE TABLE table7 (col1 int , col2 VARCHAR(100), CHECK col1 > 200)"); 
result = _db->exec("CREATE TABLE table6 (col1 int DEFAULT 100, col2 VARCHAR(100) DEFAULT 'abcd')"); 
result = _db->exec("CREATE TABLE table8 (col1 date, col2 time, col3 timestamp DEFAULT CURRENT_TIMESTAMP)"); 
_db->begintransaction(); 
result = _db->exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db->exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db->commit(); 
result = _db->exec("SELECT col1, col2 FROM table1 WHERE col1 = 1234"); 
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
