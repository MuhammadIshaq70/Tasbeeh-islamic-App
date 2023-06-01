import 'package:flutter/material.dart';
//import 'package:tasbeeh_islamic_app/clock/clock_home.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'About',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
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
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 23),
              child: Row(
                children: const [
                  Image(
                    image: AssetImage('assets/images/tasbeh.png'),
                    height: 70,
                  ),
                  Text(
                    'Tasbeeh Islamic App',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 46,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: const [
                  Text(
                    'The app is designed to help Muslims\n in performing daily Tasbeeh, Zikar,\n and Drood e Pak. It offers a simple \nand user-friendly interface that\n allows users to easily count their \ndaily Tasbeeh and Zikar. The app also\n provides a collection of authentic\n Drood e Pak for users to recite and \nseek blessings.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 26),
              child: Text('Powered By Elabd Technologies'),
            ),
          ],
        ),
      ),
    );
  }
}
