import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entity/vouchers.dart';

class VoucherDB {

  static String tableName = 'Vouchers';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (
            VoucherID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            VoucherCode TEXT NOT NULL, 
            DayStart TEXT NOT NULL, 
            DayEnd TEXT NOT NULL, 
            DateUse TEXT NOT NULL, 
            DiscountPercent INTEGER NOT NULL, 
            Description TEXT NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Vouchers vouchers) async {
    final db = await initDb();
    db.insert(tableName, vouchers.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Vouchers vouchers) async {
    final db = await initDb();
    db.update(tableName, vouchers.toMap(),
        where: 'voucherID = ?', whereArgs: [vouchers.voucherID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'voucherID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(
        tableName, where: 'voucherID = ?', whereArgs: [id]);
    return std;
  }

}