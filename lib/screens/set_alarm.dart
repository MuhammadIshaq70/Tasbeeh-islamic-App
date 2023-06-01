import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:tasbeeh_islamic_app/main.dart';
import 'package:tasbeeh_islamic_app/screens/about.dart';
import 'package:tasbeeh_islamic_app/screens/drood_e_pak.dart';
import 'package:tasbeeh_islamic_app/screens/generate_report.dart';
import 'package:tasbeeh_islamic_app/utils/notification_service.dart';

//import '../clock/test.dart';

class SetAlarm extends StatefulWidget {
  const SetAlarm({super.key});
  @override
  State<SetAlarm> createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  DateTime today = DateTime.now();
  void _onDaySeleted(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  var newTime;
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    // final hours = time.hour.toString().padLeft(2, '0');
    // final minutes = time.minute.toString().padLeft(2, '0');
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
            '           Set Alarm',
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
                  Row(
                    children: const [
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
            padding: const EdgeInsets.all(8.0),
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
                              blurRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green)),
                    child: const Row(
                      children: [
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
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Text(
                      'Prayer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Time    ',
                      style: TextStyle(
                        fontSize: 16,
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
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/Shape.png'),
                    height: 50,
                    width: 40,
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
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      '${time.hour}:${time.minute}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Image(image: AssetImage('assets/images/alarm.png')),
                  ),
                ],
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
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  title: const Text("Calender"),
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
                                            isSameDay(day, today),
                                        focusedDay: today,
                                        firstDay: DateTime.utc(2010, 11, 28),
                                        lastDay: DateTime.utc(2030, 11, 28),
                                        onDaySelected: _onDaySeleted,
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
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Icon(Icons.calendar_month),
                          ))
                    ],
                  ),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      'Select Time',
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
              InkWell(
                onTap: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time,
                  );
                  if (newTime == null) return;
                  setState(() => time = newTime);
                },
                child: Container(
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
                        Text(
                          '${time.hour}:${time.minute}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        const Icon(Icons.more_time_sharp)

                        // Image(image: AssetImage('assets/images/Vector (3).png'))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              InkWell(
                onTap: () {
                  if (DateTime.now().isBefore(DateTime(today.year, today.month,
                      today.day, time.hour, time.minute))) {
                    LocalNotificationServices().initializeNotification();
                    LocalNotificationServices().zonedScheduleNotification(
                        'Wake up call',
                        DateTime(today.year, today.month, today.day, time.hour,
                            time.minute),
                        'Good morning');
                    Fluttertoast.showToast(
                        backgroundColor: Colors.green,
                        gravity: ToastGravity.TOP,
                        textColor: Colors.white,
                        msg: "Alarm Saved");
                  } else {
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        gravity: ToastGravity.TOP,
                        textColor: Color.fromARGB(255, 241, 245, 245),
                        msg: "  Must be select  *Date and Time* in the future");
                  }
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
                      'Save Alarm',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ]))));
  }
}
