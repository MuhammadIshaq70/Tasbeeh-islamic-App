// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   DateTime today = DateTime.now();
//   void _onDaySeleted(DateTime day, DateTime focusedDay) {
//     setState(() {
//       today = day;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('calender'),
//       ),
//       body: Column(
//         children: [
//           Text('Selected date =' + today.toString().split(' ')[0]),
//           Container(
//             child: TableCalendar(
//               rowHeight: 35,
//               headerStyle:
//                   HeaderStyle(formatButtonVisible: false, titleCentered: true),
//               availableGestures: AvailableGestures.all,
//               selectedDayPredicate: (day) => isSameDay(day, today),
//               focusedDay: today,
//               firstDay: DateTime.utc(2010, 11, 28),
//               lastDay: DateTime.utc(2030, 11, 28),
//               onDaySelected: _onDaySeleted,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
