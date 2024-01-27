import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/order_details.dart';
class OrderDetailsDB {

  static String tableName = 'OrderDetails';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (
            OrderDetailsID INTEGER PRIMARY KEY NOT NULL,
            OrderID INTEGER REFERENCES Orders (OrderID) NOT NULL,
            VoucherID INTEGER REFERENCES Voucher (VoucherID) NOT NULL,
             ProductID INTEGER REFERENCES Product (ProductID) NOT NULL,
              Quantity INTEGER NOT NULL, 
              Price REAL NOT NULL, 
              ProductSize TEXT NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(OrderDetails orderDetails) async {
    final db = await initDb();
    db.insert(tableName, orderDetails.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(OrderDetails orderDetails) async {
    final db = await initDb();
    db.update(tableName, orderDetails.toMap(),
        where: 'OrderDetailsID = ?', whereArgs: [orderDetails.orderDetailsID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'orderDetailsID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(
        tableName, where: 'orderDetailsID = ?', whereArgs: [id]);
    return std;
  }
}