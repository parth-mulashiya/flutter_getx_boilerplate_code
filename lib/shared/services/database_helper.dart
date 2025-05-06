import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

import '../constants/common.dart';

class DatabaseHelper {
  static const _databaseName = 'DialerXDatabase.db';
  // static const _passwoed = 'Asdf@1234';
  static const _databaseVersion = 1;

  //singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    var path = dataDirectory.path.substring(
      0,
      dataDirectory.path.lastIndexOf('/'),
    );
    String dbPath = "$path/files/$_databaseName";

    ///data/user/0/com.surefy/app_flutterDialerXDatabase.db
    // print("-----DbPath : $dbPath");
    return await openDatabase(
      dbPath,
      version: _databaseVersion,
      onCreate: _onCreateDB,
      // password: _passwoed,
    );
  }

  Future _onCreateDB(Database db, int version) async {
    //create tables
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${LocalDBTables.callLogTable}(
        phoneAccountId TEXT ,
        number TEXT ,
        name TEXT ,
        duration TEXT,
        islive INT,
        timestamp TEXT PRIMARY KEY
      )
      ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${LocalDBTables.searchTable}(
        id TEXT,
        displayName TEXT ,
        number TEXT,
        userType TEXT ,
        conType TEXT,
        isFavorite INT,
        timestamp TEXT PRIMARY KEY
      )
      ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${LocalDBTables.spamMessageTable}(
        id TEXT,
        displayName TEXT ,
        number TEXT,
        userType TEXT ,
        message TEXT,
        timestamp TEXT PRIMARY KEY
      )
      ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${LocalDBTables.spamCallTable}(
        phoneAccountId TEXT,
        name TEXT ,
        number TEXT,
        userType TEXT,
        duration INT,
        timestamp TEXT PRIMARY KEY  
      )
      ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${LocalDBTables.verifiedNameTable}(
        id INTEGER PRIMARY KEY,
        name TEXT ,
        number TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${LocalDBTables.notificationTable}(
        id INTEGER PRIMARY KEY,
        title TEXT ,
        body TEXT ,
        url TEXT , 
        route TEXT ,
        timestamp TEXT
      )
      ''');
  }

  // Future<int> insertCallLogs(CallLogModel calllog) async {
  //   Database db = await database;
  //   var ss = 0;
  //   try {
  //     // ss = await db.insert("callLogTable", calllog.toJson());
  //     ss = await db.insert(LocalDBTables.callLogTable, calllog.toJson());
  //     // print(ss);
  //   } on DatabaseException catch (e) {
  //     print("e------$e");
  //   } on Exception catch (e) {
  //     // ignore: todo
  //     // TODO
  //     print("e------$e");
  //   }
  //   return ss;
  // }

  // Future<int> deleteNotification(int id) async {
  //   Database db = await database;
  //   return await db
  //       .delete(LocalDBTables.callLogTable, where: 'id=?', whereArgs: [id]);
  // }

  //contact - retrieve all
  // Future<List<CallLogModel>> fetchCallLogs() async {
  //   Database db = await database;
  //   // List<Map> notification = await db.query("notificationTable");
  //   List<Map> callLog = await db.query(LocalDBTables.callLogTable, columns: [
  //     'phoneAccountId',
  //     'number',
  //     'name',
  //     'duration',
  //     'timestamp',
  //     // "datetime(dateTime,'localtime') as dateTime"
  //   ]);
  //   return callLog.isEmpty
  //       ? []
  //       : callLog.map((x) => CallLogModel.fromJson(x)).toList();
  // }

  //searchTable
}
