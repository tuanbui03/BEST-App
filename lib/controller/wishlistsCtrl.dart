import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/wishlists.dart';

class WishlistsDB {

  static String tableName = 'Wishlist';

  static initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbStd = openDatabase(
      join(await getDatabasesPath(), 'dbBETS.db'),
      onCreate: (db, version) {
        String sqlCrate = """
          CREATE TABLE IF NOT EXISTS $tableName (
            WishlistID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            ProductID INTEGER REFERENCES Product (ProductID) NOT NULL, 
            UserID INTEGER NOT NULL REFERENCES Users (UserID), 
            Created_at TEXT NOT NULL, 
            Updated_at TEXT NOT NULL);
          """;
        return db.execute(sqlCrate);
      },
      version: 1,
    );
    return dbStd;
  }

  static void insertTable(Wishlist wishlist) async {
    final db = await initDb();
    db.insert(tableName, wishlist.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void updateTable(Wishlist wishlist) async {
    final db = await initDb();
    db.update(tableName, wishlist.toMap(),
        where: 'wishlistID = ?', whereArgs: [wishlist.wishlistID]);
  }

  static void deleteTable(int id) async {
    final db = await initDb();
    db.delete(tableName, where: 'wishlistID = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getListTable() async {
    final db = await initDb();
    final List<Map<String, dynamic>> stds = await db.query(tableName);
    return stds;
  }

  static Future<List<Map<String, dynamic>>> getOneTableById(int id) async {
    final db = await initDb();
    final std = await db.query(
        tableName, where: 'wishlistID = ?', whereArgs: [id]);
    return std;
  }
}