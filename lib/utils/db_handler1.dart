import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//import 'package:sqflite/sqflite.dart';
//import 'package:sqflite1/model/food.dart';
//import 'package:sql_demo/NodeModel.dart';
import 'package:tasbeeh_islamic_app/utils/notesmodel1.dart';

class DatabaseHelper {
  Database? _database;

  static final String Cid = "id";
  static final String Ccount = "count";
  static final String CselectEvent = "selectEvent";
  static final String Cdate = "date";
  static final String Ctime = "time";

  DatabaseHelper._instance();
  static final DatabaseHelper helper = DatabaseHelper._instance();

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();

      return _database!;
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();

    return await openDatabase(join(path, 'info.db'), version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE INFO($Cid INTEGER PRIMARY KEY, 
          $Cdate TEXT NOT NULL, $CselectEvent TEXT NOT NULL, $Ccount TEXT NOT NULL, $Ctime TEXT NOT NULL)
          ''');
    });
  }

  Future<List<Food>> getFood() async {
    Database db = await database;

    var foods = await db
        .query("INFO", columns: [Cid, Cdate, CselectEvent, Ccount, Ctime]);
    List<Food> foodList = [];
    foods.forEach((mfood) {
      Food food = Food.fromMap(mfood);
      foodList.add(food);
    });

    return foodList;
  }
  ///////////////////////////////// // update function
  //Future<List<Food>>

  Future<int> checkDatevalue(
      String fromDate1, int countvalue, Food food) async {
    var result;
    Database db = await database;

    result = await db.rawQuery(
        "SELECT * FROM INFO WHERE $Cdate = ? AND $CselectEvent = ?",
        [fromDate1, food.selectEvent]);

    List<Food> resultList = [];
    result.forEach((mfood) {
      Food food = Food.fromMap(mfood);
      resultList.add(food);
    });

    int output;
    if (resultList.length > 0) {
      var updatedcount = int.parse(resultList[0].count!) + countvalue;
      output = await db.update("INFO", {'count': updatedcount},
          where: "date = ? AND selectEvent = ?",
          whereArgs: [resultList[0].date, food.selectEvent]);
    } else {
      output = await db.insert("INFO", food.toMap());
    }
    return output;
  }
  /////////////////////////////////////////////////////////////

  Future<int> insert(Food food) async {
    Database db = await database;
    int result = await db.insert("INFO", food.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await database;
    int result = await db.delete("INFO", where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<int> update(Food food) async {
    Database db = await database;

    int result = await db
        .update("INFO", food.toMap(), where: "id = ?", whereArgs: [food.id]);
    return result;
  }

  // Future<List> getallFood(String fromDate, String toDate) async {
  //   var db = await database;
  //   var result = await db.rawQuery(
  //       "SELECT * FROM INFO where date >= '2023-05-19' and date <= '2023-05-25' ");

  //   return result.toList();
  // }

  Future<List> getRangeData(String fromDate, String toDate) async {
    var db = await database;
    // var endDate = '2023-06-01';
    //print(fromDate + toDate);
    var result = await db.rawQuery(
      "SELECT * FROM INFO WHERE $Cdate >= ? AND $Cdate <= ?",
      [fromDate, toDate],
    );
    // "SELECT * FROM INFO where $Cdate >= '2023-05-22' and $Cdate <= '2023-05-22'");
    // "SELECT * FROM INFO where DATE($Cdate) between $fromDate and $toDate ");
    print(result);
    return result.toList();
  }
}

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// import 'package:sqflite/sqflite.dart';
// import 'package:tasbeeh_islamic_app/utils/notesmodel1.dart';
// //import 'package:sqflite1/model/food.dart';

// class DatabaseHelper {
//   Database? _database;

//   static final String Cid = "id";
//   static final String Cname = "name";
//   static final String Cage = "age";

//   DatabaseHelper._instance();
//   static final DatabaseHelper helper = DatabaseHelper._instance();

//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initializeDatabase();
//       return _database!;
//     }
//     return _database!;
//   }

//   Future<Database> initializeDatabase() async {
//     String path = await getDatabasesPath();

//     return await openDatabase(join(path, 'info.db'), version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
//           CREATE TABLE INFO($Cid INTEGER PRIMARY KEY, 
//           $Cname TEXT NOT NULL, $Cage TEXT NOT NULL)
//           ''');
//     });
//   }

//   Future<List<Food>> getFood() async {
//     Database db = await database;

//     var foods = await db.query("INFO", columns: [Cid, Cname, Cage]);
//     List<Food> foodList = [];
//     foods.forEach((mfood) {
//       Food food = Food.fromMap(mfood);
//       foodList.add(food);
//     });

//     return foodList;
//   }

//   Future<int> insert(Food food) async {
//     Database db = await database;
//     int result = await db.insert("INFO", food.toMap());
//     return result;
//   }

//   Future<int> delete(int id) async {
//     Database db = await database;
//     int result = await db.delete("INFO", where: "id = ?", whereArgs: [id]);
//     return result;
//   }

//   Future<int> update(Food food) async {
//     Database db = await database;

//     int result = await db
//         .update("INFO", food.toMap(), where: "id = ?", whereArgs: [food.id]);
//     return result;
//   }
// }
