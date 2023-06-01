import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:sqflite/sqflite.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:tasbeeh_islamic_app/screens/about.dart';
import 'package:tasbeeh_islamic_app/screens/generate_report.dart';
import 'package:tasbeeh_islamic_app/screens/set_alarm.dart';
// import 'package:tasbeeh_islamic_app/screens/tasbeeh_zkr.dart';
// import 'package:tasbeeh_islamic_app/utils/db_Handler.dart';
import 'package:tasbeeh_islamic_app/utils/db_handler1.dart';
//import 'package:tasbeeh_islamic_app/utils/notesmodel.dart';
import 'package:tasbeeh_islamic_app/utils/notesmodel1.dart';

class Drood_E_Pak extends StatefulWidget {
  const Drood_E_Pak({super.key});

  @override
  State<Drood_E_Pak> createState() => _Drood_E_PakState();
}

class _Drood_E_PakState extends State<Drood_E_Pak> {
  DateTime today = DateTime.now();
  //Future<List<Food>>? foodList;
  //List<Food> foodList = [];

  void _onDaySeleted(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  DatabaseHelper helper = DatabaseHelper.helper;
  List<Food> foodList = [];
  List<Food> foodList1 = [];
  Future<List<Food>>? notesList;

  String dropdownvalue = 'Tasbeeh Zkar';
  String? _selectedItem;

  List<String> _items = [
    'Tasbeh / Zkar',
    'Drood e Pak   ',
  ];
  // DatabaseHelper? dbHelper;

  @override
  void initState() {
    super.initState();
    _selectedItem = _items[0];
    //DatabaseHelper = dbHelper();
    // LoadData();
    getFood();
  }

  //int number = 0;

  LoadData() async {
    notesList = DatabaseHelper.helper!.getFood();
    // notesList = dbHelper!.getCartListWithUserId();
  }

  // List of items in our dropdown menu
  // var items = [
  //   'Tasbeeh Zkar',
  //   'drood e Pak  ',
  // ];
  var formKey = GlobalKey<FormState>();
  TextEditingController countcontroller = TextEditingController();
  //DatabaseHelper helper = DatabaseHelper.helper;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getFood();
  // }
  var newTime;
  TimeOfDay time = TimeOfDay.now();
  getFood() async {}
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
            '             Events',
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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
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
                                  blurRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green)),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Indeed, Allah confers blessing \nupon the Prophet, and His angels \n[ask Him to do so]. O you who have \nbelieved, ask [Allah to confer] \nblessing upon him and ask\n[Allah to grant him] peace.\n         \n[Al-Ahzab Verse No. 56]',
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Row(
                      children: [
                        Text(
                          'Prayer',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 210,
                        ),
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Divider(
                    height: 4,
                    thickness: 3,
                    endIndent: 5,
                    indent: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SetAlarm()));
                    },
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage(
                            'assets/images/Shape.png',
                          ),
                          height: 40,
                          width: 35,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Text(
                            'Fajar Alarm',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            '${time.hour}:${time.minute}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image(
                            image: AssetImage(
                              'assets/images/alarm.png',
                            ),
                            height: 50,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    endIndent: 5,
                    indent: 5,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'Select Date',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 320,
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
                          Text(today.toString().split(' ')[0]),
                          const Spacer(),
                          // IconButton(
                          //     onPressed: () {
                          // showDialog(
                          //   barrierDismissible: false,
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: Text("Calender"),
                          //       content: Column(
                          //         children: [
                          //           Container(
                          //             child: TableCalendar(
                          //               rowHeight: 75,
                          //               headerStyle: const HeaderStyle(
                          //                   formatButtonVisible: false,
                          //                   titleCentered: true),
                          //               availableGestures:
                          //                   AvailableGestures.all,
                          //               selectedDayPredicate: (day) =>
                          //                   isSameDay(day, today),
                          //               focusedDay: today,
                          //               firstDay:
                          //                   DateTime.utc(2010, 11, 28),
                          //               lastDay:
                          //                   DateTime.utc(2030, 11, 28),
                          //               onDaySelected: _onDaySeleted,
                          //             ),
                          //           ),
                          //           TextButton(
                          //               onPressed: () {
                          //                 Navigator.of(context).pop();
                          //               },
                          //               child: Text('close'))
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // );
                          // },
                          // icon: const
                          Icon(Icons.calendar_month)
                        ],
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'Select Event',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        value: _selectedItem,
                        items: _items.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                            log("$_selectedItem", name: "selectedItem");
                          });
                        },
                      ),
                    ),
                  ),
                  // Text(selectEvent),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   height: 50,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       boxShadow: const [
                  //         BoxShadow(
                  //             color: Colors.grey,
                  //             offset: Offset(1, 1),
                  //             blurRadius: 1,
                  //             spreadRadius: 1)
                  //       ],
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(12)),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Row(
                  //       children: const [
                  //         Text(
                  //           'Drood e Pak',
                  //           style: TextStyle(
                  //             fontSize: 14,
                  //           ),
                  //         ),
                  //         // SizedBox(
                  //         //   width: 30,
                  //         //),
                  //         Spacer(),

                  //         Image(
                  //             image: AssetImage('assets/images/Down Button.png'))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'Enter Count',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                        controller: countcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Inter Count in minutes',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (String? text) {
                          if (text!.isEmpty) {
                            return 'plz provide counting ';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  const SizedBox(height: 15),
                  // today.toString().split(' ')[0]
                  InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        helper
                            .checkDatevalue(
                                today.toString().split(' ')[0],
                                int.parse(countcontroller.text),
                                Food(
                                    date: today.toString().split(' ')[0],
                                    selectEvent: _selectedItem.toString(),
                                    count: countcontroller.text,
                                    time: '10:30'))
                            .then((value) {
                          const snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Save'),
                            duration: Duration(seconds: 1),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                      countcontroller.clear();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => GenerateReport()));
                    },
                    child: Container(
                      height: 50,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
