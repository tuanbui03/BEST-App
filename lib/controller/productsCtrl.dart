import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/products.dart';
 
class ProductDB {

  static String tableName = 'Products';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (
            ProductID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            ProductName TEXT NOT NULL, 
            ImageID INTEGER NOT NULL REFERENCES Image (ImageID), 
            BrandID INTEGER REFERENCES Brands (BrandID) NOT NULL, 
            Price REAL NOT NULL, 
            Sale INTEGER NOT NULL, 
            Status INTEGER NOT NULL, 
            Description TEXT NOT NULL, 
            Size TEXT NOT NULL, 
            Color TEXT NOT NULL, 
            Code TEXT NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Products products) async {
    final db = await initDb();
    db.insert(tableName, products.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Products products) async {
    final db = await initDb();
    db.update(tableName, products.toMap(),
        where: 'productID = ?', whereArgs: [products.productID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'productID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(
        tableName, where: 'productID = ?', whereArgs: [id]);
    return std;
  }
}