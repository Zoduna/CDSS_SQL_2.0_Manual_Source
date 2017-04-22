#include "ZodunaDBOO_Database.h"
#include "ZodunaDBOO_ResultSet.h"
#include "ZodunaDBOO_Statement.h"

ZodunaDBOO_Database*		_db;
ZodunaDBOO_ResultSet*		_rs;
ZodunaDBOO_Statement*		_stmt;

_db = [ZodunaDBOO_Database databaseWithPath:@"testfolder/"];
