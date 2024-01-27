import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entity/payments.dart';
class PaymentDB {

  static String tableName = 'Payments';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (
            PaymentID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            Description TEXT NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Payment payment) async {
    final db = await initDb();
    db.insert(tableName, payment.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Payment payment) async {
    final db = await initDb();
    db.update(tableName, payment.toMap(),
        where: 'PaymentID = ?', whereArgs: [payment.paymentID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'PaymentID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(
        tableName, where: 'PaymentID = ?', whereArgs: [id]);
    return std;
  }
}