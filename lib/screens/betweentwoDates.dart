import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tasbeeh_islamic_app/utils/db_handler1.dart';

class GenerateRepor extends StatefulWidget {
  final String fromdate, todate;
  const GenerateRepor(
      {super.key, required this.fromdate, required this.todate});

  @override
  State<GenerateRepor> createState() => _GenerateReporState();
}

class _GenerateReporState extends State<GenerateRepor> {
  DatabaseHelper helper = DatabaseHelper.helper;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
              future: helper.getRangeData(widget.fromdate, widget.todate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Map<String, Object?>> dataList =
                      snapshot.data as List<Map<String, Object?>>;
                  String textData = '';

                  for (var dataItem in dataList) {
                    // int id = dataItem['id'] as int;
                    String date = dataItem['date'] as String;
                    String selectEvent = dataItem['selectEvent'] as String;
                    String count = dataItem['count'] as String;

                    String itemText = '\n'
                        '$date'
                        '                '
                        '$selectEvent'
                        '                         '
                        '$count';

                    textData += itemText;
                  }

                  return SingleChildScrollView(
                    child: Text(textData),
                  );
                }
              })
        ],
      ),
    );
  }
}
//  FutureBuilder(
//                 future: helper.getRangeData(widget.fromdate, widget.todate),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else {
//                     return Center(child: Text('Data: ${snapshot.data}'));
//                   }
//                 })
