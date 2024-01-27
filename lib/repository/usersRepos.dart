import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entity/users.dart';
class UserCtrl {

  static String tableName = 'Users';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (
            UserID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            Username TEXT NOT NULL, 
            FullName TEXT (255) NOT NULL, 
            Password TEXT NOT NULL, 
            Gender INTEGER, 
            Email TEXT NOT NULL, 
            Image BLOB, 
            Phone TEXT NOT NULL, 
            Address TEXT NOT NULL, 
            Dob TEXT NOT NULL, 
            Role INTEGER NOT NULL, 
            Status INTEGER NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Users users) async {
    final db = await initDb();
    db.insert(tableName, users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Users users) async {
    final db = await initDb();
    db.update(tableName, users.toMap(),
        where: 'UserID = ?', whereArgs: [users.userID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'UserID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(tableName, where: 'UserID = ?', whereArgs: [id]);
    return std;
  }

  static Future<List<Map<String, dynamic>>> findByName(String name) async {
    final db = await initDb();
    final std = await db.query(tableName, where: 'userName = ?', whereArgs: [name]);
    return std;
  }

  static Future<List<Map<String, dynamic>>> findByEmail(String email) async {
    final db = await initDb();
    final std = await db.query(tableName, where: 'Email = ?', whereArgs: [email]);
    return std;
  }
}