import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 9;

  static final table = 'my_table';

  static final id = 'id';
  static final userId = 'uId';
  static final userLat = 'lat';
  static final userLong = 'log';


  static  final creteUserTable = 'create_account';

  static final accountId = 'id';
  static final uId = 'uId';
  static final uMobile = 'uMobile';
  static final uMail = 'uMail';
  static final uAddrss = 'uAddress';
  static final uPass = 'uPassword';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print('local path >>'+path.toString());
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onUpgrade: (Database db, int oldV,int newV){
          print('Check ');
          print('old : '+oldV.toString()+'NewV :'+newV.toString());
           db.execute('''ALTER TABLE $creteUserTable ADD COLUMN $uPass text''');
      }
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $id INTEGER PRIMARY KEY,
            $userId TEXT NOT NULL,
            $userLat INTEGER NOT NULL,
            $userLong INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<int> userAccountInsert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(creteUserTable, row);
  }

  Future<int> userAccountUpdate(Map<String, dynamic> row) async {
    Database ?db = await instance.database;
    int id = row[uId];
    return await db!.update(creteUserTable, row, where: '$uId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future getLogin(String user, String password) async {
    Database? db = await instance.database;
    var res = await db!.rawQuery("SELECT * FROM $creteUserTable WHERE $userId = '$user' and $uPass = '$password'");
    print('login res :'+res.toString());
    if (res.length > 0) {
      return res;
    }

    return -1;
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database ?db = await instance.database;
    int id = row[userId];
    return await db!.update(table, row, where: '$userId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database ?db = await instance.database;
    return await db!.delete(table, where: '$userId = ?', whereArgs: [id]);
  }
}

