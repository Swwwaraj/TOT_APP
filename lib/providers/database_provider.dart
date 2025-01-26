import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/dog.dart';

class DatabaseProvider with ChangeNotifier {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('dogs.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    return await openDatabase(
      join(await getDatabasesPath(), filePath),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, breed TEXT, imageUrl TEXT)');
      },
    );
  }

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    try {
      await db.insert(
        'dogs',
        dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error inserting dog: $e");
    }
  }

  Future<List<Dog>> getDogs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(
        name: maps[i]['name'],
        breed: maps[i]['breed'],
        imageUrl: maps[i]['imageUrl'],
      );
    });
  }

  Future<void> deleteDog(int id) async {
    final db = await database;
    try {
      await db.delete(
        'dogs',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print("Error deleting dog: $e");
    }
  }

  Future<void> clearDogs() async {
    final db = await database;
    try {
      await db.delete('dogs');
    } catch (e) {
      print("Error clearing dogs: $e");
    }
  }
}