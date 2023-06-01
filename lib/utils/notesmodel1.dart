//import 'package:sql_demo/dbhelper.dart';
import 'package:tasbeeh_islamic_app/utils/db_handler1.dart';

class Food {
  late int? id;
  late String? selectEvent;
  late String? count;
  late String? date;
  late String? time;

  Food({this.id, this.selectEvent, this.count, this.date, this.time});

  Map<String, dynamic> toMap() {
    // ignore: prefer_function_declarations_over_variables
    var map = <String, dynamic>{
      DatabaseHelper.Ccount: count,
      DatabaseHelper.CselectEvent: selectEvent,
      DatabaseHelper.Cdate: date,
      DatabaseHelper.Ctime: time,
    };
    if (id != null) {
      map[DatabaseHelper.Cid] = id;
    }

    return map;
  }

  Food.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseHelper.Cid];
    date = map[DatabaseHelper.Cdate];
    selectEvent = map[DatabaseHelper.CselectEvent];
    count = map[DatabaseHelper.Ccount];
    time = map[DatabaseHelper.Ctime];
  }

  static where(bool Function(dynamic item) param0) {}
}


// //import 'package:sqflite1/utils/database_helper.dart';

// import 'package:tasbeeh_islamic_app/utils/db_handler1.dart';

// class Food {
//   late int? id;
//   late String name;
//   late String age;

//   Food({this.id, required this.name, required this.age});

//   Map<String, dynamic> toMap() {
//     // ignore: prefer_function_declarations_over_variables
//     var map = <String, dynamic>{
//       DatabaseHelper.Cname: name,
//       DatabaseHelper.Cage: age
//     };
//     if (id != null) {
//       map[DatabaseHelper.Cid] = id;
//     }

//     return map;
//   }

//   Food.fromMap(Map<String, dynamic> map) {
//     id = map[DatabaseHelper.Cid];
//     name = map[DatabaseHelper.Cname];
//     age = map[DatabaseHelper.Cage];
//   }
// }