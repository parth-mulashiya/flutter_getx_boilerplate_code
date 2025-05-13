import 'dart:io';

import 'package:flutter_getx_boilerplate_code/models/todo_model.dart';
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
      CREATE TABLE IF NOT EXISTS ${LocalDBTables.todo}(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT ,
        age TEXT ,
        address TEXT,
        timestamp TEXT PRIMARY KEY
      )
      ''');
  }

  Future<int> insertCallLogs(TodoModel todo) async {
    Database db = await database;
    var ss = 0;
    try {
      ss = await db.insert(LocalDBTables.todo, todo.tJson());
    } on DatabaseException catch (e) {
      print("e------$e");
    } on Exception catch (e) {
      print("e------$e");
    }
    return ss;
  }

  Future<int> deleteTodo(int id) async {
    Database db = await database;
    return await db.delete(LocalDBTables.todo, where: 'id=?', whereArgs: [id]);
  }

  Future<List<TodoModel>> fetchCallLogs() async {
    Database db = await database;
    // List<Map> notification = await db.query("notificationTable");
    List<Map<String, dynamic>> todos = await db.query(
      LocalDBTables.todo,
      columns: [
        'id',
        'name',
        'age',
        'address',
        'timestamp',
        // "datetime(dateTime,'localtime') as dateTime"
      ],
    );
    return todos.isEmpty
        ? []
        : todos.map((x) => TodoModel.fromJson(x)).toList();
  }

  Future<int> updateTodo(TodoModel todo) async {
    Database db = await database;
    return await db.update(
      LocalDBTables.todo,
      todo.tJson(),
      where: 'id=?',
      whereArgs: [todo.id],
    );
  }
}
