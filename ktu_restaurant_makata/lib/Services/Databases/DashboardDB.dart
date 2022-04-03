// // ignore_for_file: file_names

// import 'package:flutter/cupertino.dart';
// import 'package:ktu_restaurant_makata/Models/FoodModel.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';


// class DashboardDB {
//   var database;

//   Future<void> initialize() async {
//     database = openDatabase(
//       join(await getDatabasesPath(), 'dcs-customer-db.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE Table customer("
//           "id TEXT PRIMARY KEY, "
//           "foodName TEXT, "
//           "price TEXT, "
//           "description TEXT, "
//           "image TEXT, "          
//           ")",
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<bool> insertObject(FoodModel model) async {
//     try {
//       final Database db = await database; // Get a reference to the database.
//       debugPrint('Database(FOOD DB): $db');
//       await db.insert(
//         'customer',
//         model.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } catch (e) {
//       debugPrint('Insertion Error(CustomerInfoModel): $e');
//       return false;
//     }
//     return true;
//   }

//   Future<bool> updateObject(FoodModel model) async {
//     try {
//       final Database db = await database; // Get a reference to the database.
//       debugPrint('Database(CustomerInfoModel): $db');
//       await db.update(
//         'customer',
//         model.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } catch (e) {
//       debugPrint('Update Error(CustomerInfoModel): $e');
//       return false;
//     }
//     return true;
//   }

//   Future<List<FoodModel>> getAllCustomers() async {
//     try {
//       final Database db = await database;
//       // Query the obj for all The Objects.
//       final List<Map<String, dynamic>> maps = await db.query('customer');
//       debugPrint('List of items from getAllCustomers query: $maps');

//       return List.generate(
//         maps.length,
//         (i) {
//           return FoodModel(
//             // id: maps[i]['id'],
//             // foodName: maps[i]['foodName'],
//             // description: maps[i]['description'],
//             // image: maps[i]['image'],
//             // price: maps[i]['price'],
//           );
//         },
//       );
//     } catch (e) {
//       debugPrint('Fetch Error(getAllcustomer): $e');
//       return null;
//     }
//   }

//   Future<List<FoodModel>> getCustomerId(String id) async {
//     try {
//       final Database db = await database;
//       // Query the obj for all The Objects.
//       final List<Map<String, dynamic>> maps =
//           await db.rawQuery('select * from customer where id = \'' + id + '\'');
//       debugPrint('List of items from getCustomerById query: $maps');

//       return List.generate(
//         maps.length,
//         (i) {
//           return FoodModel(
//             // id: maps[i]['id'],
           
//           );
//         },
//       );
//     } catch (e) {
//       debugPrint('Fetch Error(getAllcustomer): $e');
//       return null;
//     }
//   }

//   Future<void> deleteObject(int id) async {
//     final db = await database;
//     // Remove Object from the database.
//     await db.delete(
//       'customer',
//       where: "id = ?",
//       whereArgs: [id],
//     );
//   }

//   Future<void> deleteAll() async {
//     final db = await database;
//     // Remove Object from the database.
//     await db.delete(
//       'customer',
//     );
//   }
// }
