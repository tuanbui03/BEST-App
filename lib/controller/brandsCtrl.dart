import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/brands.dart';

class BrandsCtrl {
  static String tableName = 'Brands';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
        CREATE TABLE IF NOT EXISTS $tableName (
         BrandID TEXT PRIMARY KEY NOT NULL,
         BrandName TEXT NOT NULL,
         Description TEXT NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Brands brand) async {
    final db = await initDb();
    db.insert(tableName, brand.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Brands brand) async {
    final db = await initDb();
    db.update(tableName, brand.toMap(),
        where: 'brandID = ?', whereArgs: [brand.brandID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'brandID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(tableName, where: 'brandID = ?', whereArgs: [id]);
    return std;
  }
}
