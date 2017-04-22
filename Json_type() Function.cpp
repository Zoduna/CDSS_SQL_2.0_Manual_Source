
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
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a[0]') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a[1]') FROM dumtab");
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a[2]') FROM dumtab");
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a[3]') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a[4]') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a[5]') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
result = _db->exec("SELECT json_type('{\"a\":[2,3.5,true,false,null,\"x\"]}','$.a[6]') FROM dumtab"); 
_rs = _db->getresultset();
while (_rs.getnext() == ZodunaDBSQL_Constants::ZODUNADB_ROW) 
{ 
	char*    text1 = _rs gettext(1); 
	printf("zodunadb test json = %s\n", 
		text1);
}
_rs->resultsetrelease();
_db->close(); 
