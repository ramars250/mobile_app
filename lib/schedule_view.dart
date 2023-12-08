import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];
  final List<String> yourData = [
    'Event 1\nEvent 1\nEvent 1\nEvent 1\nEvent 1\nEvent 1\nEvent 1\nEvent 1\nEvent 1',
    'Event 2',
    'Event 3',
    'Event 4',
    'Event 5',
    'Event 6',
    'Event 7',
    'Event 8',
    'Event 9',
    'Event 10',
    'Event 11',
    'Event 12',
    'Event 13',
    'Event 14',
    'Event 15',
    'Event 16',
    'Event 17',
    'Event 18',
    'Event 19',
    'Event 20',
    'Event 21',
    'Event 22',
    'Event 23',
    'Event 24',
    'Event 25',
    'Event 26',
    'Event 27',
    'Event 28',
    'Event 29',
    'Event 30',
    'Event 31',
  ];

  ScheduleView({Key? key}) : super(key: key);

  List<List<String>> getCalendarDays() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;

    List<List<String>> calendarDays = [];

    DateTime firstDayOfMonth = DateTime(year, month, 1);

    for (int i = 0; i < firstDayOfMonth.weekday % 7; i++) {
      calendarDays.add(['', '']);
    }

    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
    int daysInMonth = lastDayOfMonth.day;

    for (int i = 1; i <= daysInMonth; i++) {
      calendarDays.add([i.toString(), yourData[i - 1]]);
    }

    int remainingEmptySpaces = 7 - (calendarDays.length % 7);
    if (remainingEmptySpaces != 7) {
      for (int i = 0; i < remainingEmptySpaces; i++) {
        calendarDays.add(['', '']);
      }
    }

    return calendarDays;
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> calendarDays = getCalendarDays();

    // 生成日曆與日期的網格部分
    List<Widget> calendarGrid = List.generate(calendarDays.length, (index) {
      // 檢查星期幾，1代表星期日，0代表星期六
      int dayOfWeek = (index + 1) % 7;
      Color textColor = Colors.black; // 預設文字顏色為黑色

      // 如果是星期六或星期日，設定文字顏色為紅色
      if (dayOfWeek == 1 || dayOfWeek == 0) {
        textColor = Colors.red;
      }
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              calendarDays[index][0],
              style: TextStyle(
                fontSize: 20.0,
                color: textColor,
              ),
            ),
            //添加間距分隔日期與事件訊息
            const Divider(height: 4),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  calendarDays[index][1],
                  style: const TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('部門班表'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
            height: MediaQuery.of(context).size.height * 2,
            width: MediaQuery.of(context).size.width * 2,
            child: Column(
              children: [
                // 将日期部分放置在日曆上方
                Row(
                  children: daysOfWeek
                      .map((day) => Expanded(
                            child: Center(
                              child: Text(
                                day,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: calendarGrid.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: .6,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return calendarGrid[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ScheduleView extends StatelessWidget {
//   ScheduleView({super.key});

//   final List<String> daysOfWeek = [
//     'SUN',
//     'MON',
//     'TUE',
//     'WED',
//     'THU',
//     'FRI',
//     'SAT'
//   ];
//   final List<String> additionalRowData = [
//     '資料1',
//     '資料2',
//     '資料3',
//     '資料4',
//     '資料5',
//     '資料6',
//     '資料7'
//   ];

//   List<List<String>> generateCalendarData(int year, int month) {
//     List<List<String>> calendarData = [];

//     DateTime firstDayOfMonth = DateTime(year, month, 1);

//     int daysInMonth = DateTime(year, month + 1, 0).day;

//     int offset = firstDayOfMonth.weekday - 1;

//     int dayCounter = 1;

//     for (var i = 0; i < 6; i++) {
//       List<String> week = [];

//       for (var j = 0; j < 7; j++) {
//         if ((i == 0 && j < offset || dayCounter > daysInMonth)) {
//           week.add('');
//         } else {
//           week.add('$dayCounter');
//           dayCounter++;
//         }
//       }

//       calendarData.add(week);
//       if (dayCounter > daysInMonth) {
//         break;
//       }
//     }
//     return calendarData;
//   }

//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     int currentYear = now.year;
//     int currentMonth = now.month;

//     List<List<String>> calendarData =
//         generateCalendarData(currentYear, currentMonth);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('部門班表'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Container(
//             padding: const EdgeInsets.only(top: 20.0, left: 25.0),
//             height: MediaQuery.of(context).size.height * 2,
//             width: MediaQuery.of(context).size.width * 2,
//             alignment: Alignment.topLeft,
//             child: DataTable(
//               border: TableBorder.all(width: 2.0),
//               columns: daysOfWeek
//                   .map((day) => DataColumn(
//                       label: Container(
//                           alignment: Alignment.center,
//                           width: MediaQuery.of(context).size.width / 5.5,
//                           child: Text(day))))
//                   .toList(),
//               rows: calendarData.map((week) {
//                 return DataRow(
//                   cells: week.map((day) {
//                     List<Widget> cells = [
//                       Center(child: Text(day)),
//                     ];

//                     // 添加一行分隔内容
//                     cells.add(const SizedBox(
//                       height: 20, // 调整高度以适应内容
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Divider(height: 1), // 分隔线
//                           Expanded(
//                             child: Center(
//                               child: Text('Your Data'), // 在这里放置你的数据
//                             ),
//                           ),
//                         ],
//                       ),
//                     ));

//                     return DataCell(Column(
//                       children: cells,
//                     ));
//                   }).toList(),
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
