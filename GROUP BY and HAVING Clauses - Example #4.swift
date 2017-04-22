
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
result = _db.exec("CREATE table t1 (col1 int, col2 varchar(10))") 
result = _db.exec("CREATE table t2 (col1 int, col2 varchar(10))")

_db.begintransaction()
result = _db.exec("INSERT into t1 values (22, 'mmmmmm1')")
result = _db.exec("INSERT into t1 values (11, 'mmmmmm2')")
result = _db.exec("INSERT into t2 (col1, col2) values (55, NULL)")
result = _db.exec("INSERT into t2 values (33, 'pppppp1')")
result = _db.exec("INSERT into t2 values (44, 'pppppp2')")
result = _db.exec("INSERT into t2 values (44, 'wwwww1')")
result = _db.exec("INSERT into t2 values (66, 'wwwww2')")
result = _db.exec("INSERT into t1 values (66, 'mmmmmm3')")
_db.commit()
result = _db.exec("SELECT t2.col2, count(t2.col1) from t1, t2 where t1.col1 = 22 group by t2.col2")
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(2) 
	let  text1 = _rs.gettext(1) 
	println("zodunadb test col1 = \(int1), col2 = \(text1)")
		
}
_rs.resultsetrelease()
result = _db.exec("SELECT t2.col2, count(t2.col1) from t1, t2 group by t2.col2 having count(t2.col1) = 2")
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(2) 
	let  text1 = _rs.gettext(1) 
	println("zodunadb test col1 = \(int1), col2 = \(text1)")
		
}
_rs.resultsetrelease()
_db.close()
