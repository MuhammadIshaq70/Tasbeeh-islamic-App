import 'package:flutter/material.dart';
import 'package:tasbeeh_islamic_app/screens/about.dart';
import 'package:tasbeeh_islamic_app/screens/drood_e_pak.dart';
import 'package:tasbeeh_islamic_app/screens/generate_report.dart';
import 'package:tasbeeh_islamic_app/screens/set_alarm.dart';
//import 'package:tasbeeh_islamic_app/screens/tasbeeh_zkr.dart';

class Drood_e_Pak extends StatefulWidget {
  const Drood_e_Pak({super.key});

  @override
  State<Drood_e_Pak> createState() => _Drood_e_PakState();
}

class _Drood_e_PakState extends State<Drood_e_Pak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          '            Tasbeeh',
          style: TextStyle(color: Colors.green),
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
                //       'Tasbeeh/Zikar',
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
                          builder: ((context) => const Drood_E_Pak())));
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
                          builder: ((context) => const SetAlarm())));
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
                          builder: ((context) => const GenerateReport())));
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const About())));
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
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 70, top: 40),
            child: Image(
              image: AssetImage(
                'assets/images/Capture.PNG',
              ),
              fit: BoxFit.cover,
              height: 220,
              width: 250,
            ),
          )
        ],
      ),
    );
  }
}
