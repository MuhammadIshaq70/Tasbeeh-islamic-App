import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasbeeh_islamic_app/screens/about.dart';
import 'package:tasbeeh_islamic_app/screens/drood_e_pak.dart';
import 'package:tasbeeh_islamic_app/screens/generate_report.dart';
import 'package:tasbeeh_islamic_app/screens/set_alarm.dart';

class Tasbeeh_Zkr extends StatefulWidget {
  const Tasbeeh_Zkr({super.key});

  @override
  State<Tasbeeh_Zkr> createState() => _Tasbeeh_ZkrState();
}

class _Tasbeeh_ZkrState extends State<Tasbeeh_Zkr> {
  String dropdownvalue = 'Tasbeeh Zkar';
  String? _selectedItem;

  List<String> _items = [
    'Tasbeh / Zkar',
    'Drood e Pak',
  ];
  @override
  void initState() {
    super.initState();
    _selectedItem = _items[0];
  }

  // List of items in our dropdown menu
  var items = [
    'Tasbeeh Zkar',
    'drood e Pak',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  DateTime today = DateTime.now();
  void _onDaySeleted(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  var formKey = GlobalKey<FormState>();
  //var newTime;
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
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
            'Tasbeeh/Zikr',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Tasbeeh_Zkr())));
                      },
                      child: const Text(
                        'Tasbeeh/Zikr',
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
                            builder: ((context) => Drood_E_Pak())));
                      },
                      child: const Text(
                        'Drood e Pak',
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
                      child: Text(
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
                      child: Text(
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
                      child: Text(
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
                ],
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
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
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Abdullah bin Mas’ud narrated that :\nAllah’s Messenger said: “The\n person closest to me on the Day of \nJudgement is the one who sent the\n most Salat \nupon me.”\n  \n – [Sunan al-Tirmidhī 484]',
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: const [
                        Text(
                          'Prayer',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SetAlarm()));
                    },
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/Shape.png'),
                          height: 50,
                          width: 40,
                        ),
                        Padding(
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
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image(
                              image: AssetImage('assets/images/alarm.png')),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    endIndent: 5,
                    indent: 5,
                  ),
                  Row(
                    children: const [
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
                  SizedBox(
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
                          Text('' + today.toString().split(' ')[0]),
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
                                          Container(
                                            child: TableCalendar(
                                              rowHeight: 75,
                                              headerStyle: HeaderStyle(
                                                  formatButtonVisible: false,
                                                  titleCentered: true),
                                              availableGestures:
                                                  AvailableGestures.all,
                                              selectedDayPredicate: (day) =>
                                                  isSameDay(day, today),
                                              focusedDay: today,
                                              firstDay:
                                                  DateTime.utc(2010, 11, 28),
                                              lastDay:
                                                  DateTime.utc(2030, 11, 28),
                                              onDaySelected: _onDaySeleted,
                                            ),
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
                                );
                              },
                              icon: Icon(Icons.calendar_month))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: const [
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
                  SizedBox(
                    height: 10,
                  ),

                  //dropdown button
                  Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
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
                          });
                        },
                      ),
                    ),
                  ),

                  // extra container

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
                  //       children: [
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

                  //         IconButton(
                  //             onPressed: () {
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   DropdownButton(
                  //                     // Initial Value
                  //                     value: dropdownvalue,

                  //                     // Down Arrow Icon
                  //                     // icon: const Icon(Icons.keyboard_arrow_down),

                  //                     // Array list of items
                  //                     items: items.map((String items) {
                  //                       return DropdownMenuItem(
                  //                         value: items,
                  //                         child: Text(items),
                  //                       );
                  //                     }).toList(),
                  //                     // After selecting the desired option,it will
                  //                     // change button value to selected value
                  //                     onChanged: (String? newValue) {
                  //                       setState(() {
                  //                         dropdownvalue = newValue!;
                  //                       });
                  //                     },
                  //                   ),
                  //                 ],
                  //               );
                  //             },
                  //             icon: const Image(
                  //                 image: AssetImage(
                  //                     'assets/images/Down Button.png')))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'Enter Count(Writes in minutes)',
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'how many time do you read drood e pak',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
