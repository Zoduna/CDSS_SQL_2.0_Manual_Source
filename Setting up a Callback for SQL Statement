
//following should be used as include
#include "zodunadboo/ZodunaDBOO_Database.h"



int selectcallback(void* NotUsed, int numberofcolumns, char** datavalues,  char** columnnames)
{
	//processing of column values should be put in the Callback routine
	int			i = 0;
	for (i = 0; i < numberofcolumns; i++)
	{
		printf("column name = %s, value = %s\n", columnnames[i], datavalues[i]);
	}
	return 0;
}
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
bool result = _db->exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))"); 
result = _db->exec("CREATE UNIQUE INDEX idx1 ON table1(col1))"); 
result = _db->exec("CREATE TABLE table2 (col3 int REFERENCES table2 (col1), col4 VARCHAR(100))"); 

result = _db->exec("INSERT INTO table1 VALUES (1234, 'abcd')"); 
result = _db->exec("INSERT INTO table1 VALUES (5678, 'efgh')"); 
result = _db->exec("INSERT INTO table2 VALUES (1234, 'mnop')"); 

_db->execwithcallback("SELECT col1, col2 FROM table1 WHERE col1 = 1234", selectcallback);
_db->close();

