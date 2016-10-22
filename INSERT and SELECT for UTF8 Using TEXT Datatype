

//following should be used as import

import Cocoa

import ZodunaCDBOSXSwiftWrapper

 

 

//following should be used in the
method where a DataStore is to be accessed

var _db:ZodunaDBSwiftSQL_Database

var _rs:ZodunaDBSwiftSQL_ResultSet

var _stmt:ZodunaDBSwiftSQL_Statement;
var result:Bool = false

_db =
ZodunaDBSwiftSQL_Database(pathname:"testfolder/")

let 
isOpen = _db.open(nil, password:nil)//returns "true" if
successful and "false" if the command fails. 

if (!isOpen) 

{ 

                 println("zodunadb error while opening
database")  

                return


} 

result = _db.exec("CREATE TABLE
table1 (col1 int, col2 TEXT)") 

_db.begintransaction()

result = _db.exec("INSERT INTO
table1 VALUES(1234, '\u00E9')") 

_db.commit()

result = _db.exec("SELECT col2 FROM table1") 

_rs = _db.getresultset()

while (_rs.getnext() == ZODUNADB_ROW)


{ 

                NSString*    text1 = _rs.gettext16(1) 

}

_rs.resultsetrelease() 

_db.close()
