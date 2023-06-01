import 'dart:async';
import 'dart:developer';

// //import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'package:excel/excel.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:tasbeeh_islamic_app/screens/about.dart';
import 'package:tasbeeh_islamic_app/screens/drood_e_pak.dart';
import 'package:tasbeeh_islamic_app/screens/betweentwoDates.dart';
import 'package:tasbeeh_islamic_app/screens/set_alarm.dart';
import 'package:tasbeeh_islamic_app/screens/share_report.dart';
import 'package:tasbeeh_islamic_app/screens/test.dart';
//import 'package:tasbeeh_islamic_app/screens/test.dart';
// import 'package:tasbeeh_islamic_app/screens/tasbeeh_zkr.dart';
// import 'package:tasbeeh_islamic_app/utils/db_Handler.dart';
import 'package:tasbeeh_islamic_app/utils/db_handler1.dart';
//import 'package:tasbeeh_islamic_app/utils/notesmodel.dart';
import 'package:tasbeeh_islamic_app/utils/notesmodel1.dart';

class GenerateReport extends StatefulWidget {
  const GenerateReport({super.key});

  @override
  State<GenerateReport> createState() => _GenerateReportState();
}

class _GenerateReportState extends State<GenerateReport> {
  DatabaseHelper helper = DatabaseHelper.helper;
  List<Food> foodList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFood();
    calcteTotal();
  }

  getFood() async {
    if (foodList.isEmpty) {
      foodList = await getFoodList();
      setState(() {});
    }
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime Date = DateTime.now();
  DateTime Date1 = DateTime.now();

  DateTime? fromDate;
  DateTime? toDate;
  void _onDaySeleted(DateTime day, DateTime focusedDay) {
    setState(() {
      fromDate = day;
      print(fromDate.toString().split(' ')[0]);
    });
  }

  void _onDaySeleted2(DateTime day, DateTime focusedDay) {
    setState(() {
      toDate = day;
      print(toDate.toString().split(' ')[0]);
    });
  }

  //DatabaseHelper helper = DatabaseHelper.helper;
  //List<Food> foodList = [];

  DatabaseHelper? dbHelper;

  Future<List<Food>>? notesList;
  LoadData() async {
    notesList = dbHelper!.getFood();
    setState(() {
      notesList = dbHelper!.getFood();
    });
    //print("notelist ${notesList} ");
  }

  bool isselected = false;

  int total = 0;
  void calcteTotal() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Image.asset(
                  'assets/images/drawer.png',
                  height: 14,
                  width: 20,
                ),
              );
            },
          ),
          title: const Text(
            '     Generate Report',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Container(
                  color: Colors.white,
                  // height: 40,
                  // width: 40,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('assets/images/tasbeh.png'),
                        height: 90,
                      ),
                      Text(
                        'Islamic App',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  // ListTile(
                  //   title: InkWell(
                  //     onTap: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: ((context) => Tasbeeh_Zkr())));
                  //     },
                  //     child: const Text(
                  //       'Tasbeeh/Zikr',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const Divider(
                  //   indent: 20,
                  //   color: Colors.grey,
                  //   height: 5,
                  //   endIndent: 10,
                  //   thickness: 2,
                  // ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Drood_E_Pak())));
                      },
                      child: const Text(
                        'Events',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    color: Colors.grey,
                    height: 5,
                    endIndent: 10,
                    thickness: 2,
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => SetAlarm())));
                      },
                      child: const Text(
                        'Set Alarm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    color: Colors.grey,
                    height: 5,
                    endIndent: 10,
                    thickness: 2,
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => GenerateReport())));
                      },
                      child: const Text(
                        'Genarate Report',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    color: Colors.grey,
                    height: 5,
                    endIndent: 10,
                    thickness: 2,
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((context) => About())));
                      },
                      child: const Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    color: Colors.grey,
                    height: 5,
                    endIndent: 10,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 280,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 180,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.green,
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(color: Colors.green)
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Shaikh Zardaq (radi Allahu anhu)\n says that when the writer of the\n book of Durood Shareef died, for\n one month the fragrance of flowers\n used to arise from his grave.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/Capture.PNG'),
                          height: 90,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  Text(
                    'From',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    'To',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(fromDate == null
                              ? 'Select date'
                              : fromDate.toString().split(' ')[0]),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: Text("Calender"),
                                        content: Builder(
                                          builder: (BuildContext context) {
                                            return Column(
                                              children: [
                                                TableCalendar(
                                                    firstDay: DateTime.utc(
                                                        2023, 1, 1),
                                                    lastDay: DateTime.utc(
                                                        2023, 12, 31),
                                                    focusedDay: Date,
                                                    availableGestures:
                                                        AvailableGestures.all,
                                                    selectedDayPredicate:
                                                        (day) => isSameDay(
                                                            day, fromDate),
                                                    calendarFormat:
                                                        _calendarFormat,
                                                    onFormatChanged: (format) {
                                                      setState(() {
                                                        _calendarFormat =
                                                            format;
                                                      });
                                                    },
                                                    onDaySelected:
                                                        _onDaySeleted),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('close'))
                                              ],
                                            );
                                          },
                                        ));
                                  },
                                );
                              },
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(toDate == null
                              ? 'Select date'
                              : toDate.toString().split(' ')[0]),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Calender"),
                                      content: Column(
                                        children: [
                                          TableCalendar(
                                            rowHeight: 75,
                                            headerStyle: const HeaderStyle(
                                                formatButtonVisible: false,
                                                titleCentered: true),
                                            availableGestures:
                                                AvailableGestures.all,
                                            selectedDayPredicate: (day) =>
                                                isSameDay(day, toDate),
                                            focusedDay: Date1,
                                            firstDay:
                                                DateTime.utc(2010, 11, 28),
                                            lastDay: DateTime.utc(2030, 11, 28),
                                            onDaySelected: _onDaySeleted2,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('close'))
                                        ],
                                      ),
                                    );
                                  },
                                ).then((value) {
                                  setState(() {
                                    isselected = true;
                                  });
                                });
                              },
                              icon: Icon(Icons.calendar_month))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Row(
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  //Spacer(),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Event',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    'Count/Duration',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                height: 1,
                thickness: 3,
              ),
              const SizedBox(
                height: 10,
              ),

              // get data from firebase
              SingleChildScrollView(
                child: Container(
                    height: 190,
                    child: isselected == true
                        ? GenerateRepor(
                            fromdate: fromDate.toString().split(' ')[0],
                            todate: toDate.toString().split(' ')[0],
                          )
                        : ListView.builder(
                            reverse: false,
                            shrinkWrap: true,
                            itemCount: foodList.length,
                            itemBuilder: (context, index) {
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
                            })),
              ),

              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ExcelForm()));
                      },

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => GenerateRepor(
                      //               fromdate:
                      //                   fromDate.toString().split(' ')[0],
                      //               todate: toDate.toString().split(' ')[0],
                      //             )));

                      child: Container(
                        height: 50,
                        width: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Text(
                            'Generate Report',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShareReport()));
                        log(notesList.toString());
                      },
                      child: Container(
                        height: 47,
                        width: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TableCalendar(
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2023, 12, 31),
                  focusedDay: Date,
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, fromDate),
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onDaySelected: _onDaySeleted)
            ]))));
  }

  Future<List<Food>> getFoodList() async {
    var list = await helper.getFood() as List<Food>;
    return list;
  }

  // _creatExcel() {
  //   final excel = Excel.createExcel();
  //   final sheet = excel.sheets[excel.getDefaultSheet() as String];
  //   sheet!.setColWidth(2, 50);
  //   sheet.setColAutoFit(3);

  //   sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2)).value =
  //       'Date';
  //   sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 2)).value =
  //       'SelectEvent';
  //   sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 2)).value =
  //       ' Count/Duration';

  //   excel.save();
  // }
}
// FutureBuilder<List<Student>>(
//                   future: DBHelper.instance.getAllStudents(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<List<Student>> snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else {
//                       if (snapshot.data!.isEmpty) {
//                         return const Center(child: Text('No Records Found'));
//                       } else {
//                         List<Student> students = snapshot.data!;

//                         return Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: ListView.builder(
//                               itemCount: students.length,
//                               itemBuilder: (context, index) {
//                                 Student s = students[index];
//                                 return Container(
//                                   margin: const EdgeInsets.only(bottom: 16.0),
//                                   padding: const EdgeInsets.all(16.0),
//                                   decoration: BoxDecoration(
//                                     color: Colors.amber[200],
//                                     borderRadius: BorderRadius.circular(16.0),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         padding: const EdgeInsets.all(16.0),
//                                         decoration: BoxDecoration(
//                                             color: Colors.red[100],
//                                             borderRadius:
//                                                 BorderRadius.circular(16.0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(s.id.toString()),
//                                             Text(s.date),
//                                             Text(s.alarmTime),
//                                             Text(s.count.toString()),
//                                             Text(s.selectEvent.toString())
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                         );
//                       }
//                     }
//                   }),