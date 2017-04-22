

//following should be used as import

import Cocoa

import ZodunaCDBOSXSwiftWrapper

 

 

//following should be used in the method where a
DataStore is to be accessed

var _db:ZodunaDBSwiftSQL_Database
var _rs:ZodunaDBSwiftSQL_ResultSet
var _stmt:ZodunaDBSwiftSQL_Statement; var result:Bool = false
_db = ZodunaDBSwiftSQL_Database(pathname:"testfolder/")
let  isOpen = _db.open(nil,
password:nil)//returns "true" if successful and "false" if
the command fails. 
if (!isOpen) 
{ 
                println("zodunadb
error while opening DataStore\n") 
                return 
}

result = _db.exec("CREATE TABLE table1 (col1
VARCHAR(100), col2 int)") 

result = _db.exec("CREATE UNIQUE INDEX idx1 ON
table1 (col2)")

_db.begintransaction()
result = _db.exec("INSERT INTO table1 VALUES('abcd', 17)") 
result = _db.exec("INSERT INTO table1 VALUES('efgh', 19)") 

result = _db.exec("INSERT INTO table1
VALUES('mnop9', 114)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop8', 104)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop7', 94)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop6', 84)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop5', 74)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop4', 64)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop3', 54)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop2', 44)")  

result = _db.exec("INSERT INTO table1
VALUES('mnop1', 34)") 
_db.commit()
result = _db.exec("SELECT col2, col1 FROM table1") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
                let int1 =
_rs.getint(1)

                let
text1 = _rs.gettext(2)

                println("zodunadb test col2 = \(int1), col1 =
\(test1)") 
                                
}
_rs.resultsetrelease()
_db.close()
