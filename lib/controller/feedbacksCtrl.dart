import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/feedbacks.dart';
class FeedbacksCtrl {
  
  static String tableName = 'Feedbacks';
  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (FeedbackID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
           UserID INTEGER REFERENCES Users (UserID) NOT NULL, 
           ProductID INTEGER REFERENCES Product (ProductID) NOT NULL, Content TEXT);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Feedbacks feedback) async {
    final db = await initDb();
    db.insert(tableName, feedback.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Feedbacks feedback) async {
    final db = await initDb();
    db.update(tableName, feedback.toMap(),
        where: 'feedbackID = ?', whereArgs: [feedback.feedbackID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'feedbackID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(tableName, where: 'feedbackID = ?', whereArgs: [id]);
    return std;
  }
}
