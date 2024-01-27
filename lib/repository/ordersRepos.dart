import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entity/orders.dart';
class OrdersCtrl {

  static String tableName = 'Orders';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (
            OrderID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            UserID INTEGER REFERENCES Users (UserID) NOT NULL, 
            PaymentID INTEGER NOT NULL REFERENCES Payment (PaymentID),
            Address TEXT NOT NULL, 
            Total REAL, 
            DateCreated TEXT NOT NULL, 
            Status INTEGER NOT NULL, 
            Phone TEXT NOT NULL, 
            FullName TEXT NOT NULL, 
            Email TEXT NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Orders orders) async {
    final db = await initDb();
    db.insert(tableName, orders.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Orders orders) async {
    final db = await initDb();
    db.update(tableName, orders.toMap(),
        where: 'OrderID = ?', whereArgs: [orders.orderID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'OrderID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(
        tableName, where: 'OrderID = ?', whereArgs: [id]);
    return std;
  }
}