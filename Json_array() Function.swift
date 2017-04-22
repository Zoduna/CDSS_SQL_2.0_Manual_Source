
//following should be used as import
import Cocoa
import ZodunaCDBOSXSwiftWrapper


//following should be used in the method where a DataStore is to be accessed
var _db:ZodunaDBSwiftSQL_Database
var _rs:ZodunaDBSwiftSQL_ResultSet
var _stmt:ZodunaDBSwiftSQL_Statement; var result:Bool = false
_db = ZodunaDBSwiftSQL_Database(pathname:"testfolder/")
let  isOpen = _db.open(nil, password:nil)//returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	println("zodunadb error while opening DataStore\n") 
	return 
} 
result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))") 
_db.begintransaction()
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')") 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')") 
_db.commit()
result = _db.exec("SELECT json_array(1,2,'3',4) FROM dumtab") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let  text1 = _rs.gettext(1) 
	println("zodunadb test json = \(text1)")
		
}
_rs.resultsetrelease()
result = _db.exec("SELECT json_array('[1,2]') FROM dumtab") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let  text1 = _rs.gettext(1) 
	println("zodunadb test json = \(text1)")
		
}
_rs.resultsetrelease()
result = _db.exec("SELECT json_array(json_array(1,2)) FROM dumtab") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let  text1 = _rs.gettext(1) 
	println("zodunadb test json = \(text1)")
		
}
_rs.resultsetrelease()
result = _db.exec("SELECT json_array(1,null,'3','[4,5]','{\"six\":7.7}') FROM dumtab") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let  text1 = _rs.gettext(1) 
	println("zodunadb test json = \(text1)")
		
}
_rs.resultsetrelease()
result = _db.exec("SELECT json_array(1,null,'3',json('[4,5]'),json('{\"six\":7.7}')) FROM dumtab") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let  text1 = _rs.gettext(1) 
	println("zodunadb test json = \(text1)")
		
}
_rs.resultsetrelease()
_db.close() 
