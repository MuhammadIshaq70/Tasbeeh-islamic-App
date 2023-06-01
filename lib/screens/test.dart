import 'dart:math';

import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'dart:io';
import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';
//import 'package:universal_html/html.dart' show AnchorElement;
//import 'package:flutter/foundation.dart' show kIsWeb;
//import 'dart:convert';
import 'package:excel/excel.dart';
import 'package:tasbeeh_islamic_app/utils/db_handler1.dart';
import 'package:tasbeeh_islamic_app/utils/notesmodel1.dart';
//import 'dart:io';
import 'package:path/path.dart';

class ExcelForm extends StatefulWidget {
  const ExcelForm({super.key});

  @override
  State<ExcelForm> createState() => _ExcelFormState();
}

class _ExcelFormState extends State<ExcelForm> {
  DatabaseHelper? dbHelper;

  Future<List<Food>>? notesList;
  DatabaseHelper helper = DatabaseHelper.helper;
  List<Food> foodList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFood();
  }

  getFood() async {
    if (foodList.isEmpty) {
      foodList = await getFoodList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Export To excel'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: 590,
                child: ListView.builder(
                    reverse: false,
                    shrinkWrap: true,
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      print(getFoodList());
                      return Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Text(
                              foodList[index].date!,
                              style: TextStyle(fontSize: 13),
                            ),
                            // Spacer(),
                            const SizedBox(
                              width: 45,
                            ),
                            Text(
                              foodList[index].selectEvent!,
                              style: TextStyle(fontSize: 13),
                            ),
                            // Spacer(),
                            const SizedBox(
                              width: 80,
                            ),
                            Text(
                              foodList[index].count!,
                              style: TextStyle(fontSize: 13),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            TextButton(
                onPressed: _createExcel, child: Center(child: Text('create'))),
          ],
        ),
      ),
    );
  }

  late final Excel excel;

  List<String> test = ['a', 'b', 'c'];
  void _createExcel() {
    final excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.setColWidth(2, 50);
    sheet.setColAutoFit(3);
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1)).value =
        'text helo hello';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2)).value =
        'text helo';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 2)).value =
        'Static value is ';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3)).value =
        'List is empty';

    // for (int i = 0; i < foodList.length; i++) {
    //   print(i);
    //   sheet
    //       .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 2))
    //       .value = foodList[i].count;
    //   print(i);
    // }

    // excel.save();
    var fileBytes = excel.save();
    var directory = '/storage/emulated/0/documents/';

    File(join('$directory/output_file_name.xlsx'))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
  }

  Future<List<Food>> getFoodList() async {
    var list = await helper.getFood() as List<Food>;
    foodList = await helper.getFood() as List<Food>;
    return list;
  }

  // _creatExcel() {
  //   final excel = Excel.createExcel();
  //   final sheet = excel.sheets[excel.getDefaultSheet() as String];
  //   sheet!.setColWidth(2, 50);
  //   sheet.setColAutoFit(3);

  //   sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2)).value =
  //       'text';
  //   sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 2)).value =
  //       'text text text text texttexttext';
  //   sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 2)).value =
  //       '              text text text text text text text text text';
  //   excel.save();
  // }
}
