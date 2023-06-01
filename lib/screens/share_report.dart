import 'package:flutter/material.dart';
import 'package:tasbeeh_islamic_app/screens/about.dart';
import 'package:tasbeeh_islamic_app/screens/drood_e_pak.dart';
import 'package:tasbeeh_islamic_app/screens/generate_report.dart';
import 'package:tasbeeh_islamic_app/screens/set_alarm.dart';
//import 'package:tasbeeh_islamic_app/screens/tasbeeh_zkr.dart';
import 'package:tasbeeh_islamic_app/utils/db_handler1.dart';
import 'package:tasbeeh_islamic_app/utils/notesmodel1.dart';

class ShareReport extends StatefulWidget {
  const ShareReport({super.key});

  @override
  State<ShareReport> createState() => _ShareReportState();
}

class _ShareReportState extends State<ShareReport> {
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
            'Share Report',
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
                            builder: (context) => GenerateReport()));
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
                              blurRadius: 1,
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green)),
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
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Spacer(),
                  // SizedBox(
                  //   width: 160,
                  // ),
                  Text(
                    'Event',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    'Count/Duration',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
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
              SingleChildScrollView(
                child: Container(
                  height: 290,
                  child: ListView.builder(
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
                                width: 10,
                              ),
                              const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Vector.png'),
                    const SizedBox(
                      width: 40,
                    ),
                    Image.asset('assets/images/Vector (1).png'),
                    const SizedBox(
                      width: 40,
                    ),
                    Image.asset('assets/images/Vector (2).png')
                  ],
                ),
              )
            ]))));
  }

  Future<List<Food>> getFoodList() async {
    var list = await helper.getFood() as List<Food>;
    return list;
  }
}
