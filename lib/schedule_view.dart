import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({super.key});

  final List<String> daysOfWeek = [
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT'
  ];
  final List<String> additionalRowData = [
    '資料1',
    '資料2',
    '資料3',
    '資料4',
    '資料5',
    '資料6',
    '資料7'
  ];

  List<List<String>> generateCalendarData(int year, int month) {
    List<List<String>> calendarData = [];

    DateTime firstDayOfMonth = DateTime(year, month, 1);

    int daysInMonth = DateTime(year, month + 1, 0).day;

    int offset = firstDayOfMonth.weekday - 1;

    int dayCounter = 1;

    for (var i = 0; i < 6; i++) {
      List<String> week = [];

      for (var j = 0; j < 7; j++) {
        if ((i == 0 && j < offset || dayCounter > daysInMonth)) {
          week.add('');
        } else {
          week.add('$dayCounter');
          dayCounter++;
        }
      }

      calendarData.add(week);
      if (dayCounter > daysInMonth) {
        break;
      }
      // if (i == 0) {
      //   week.addAll(List.generate(offset, (_) => ''));
      // }

      // for (var j = offset + 1;
      //     j <= 7 && (i * 7 + j - offset) <= daysInMonth;
      //     j++) {
      //   DateTime currentDate = DateTime(year, month, i * 7 + j - offset);
      //   week.add('${currentDate.day}');
      // }
      // while (week.length < 7) {
      //   week.add('');
      // }
      // calendarData.add(week);
    }
    return calendarData;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    int currentMonth = now.month;

    List<List<String>> calendarData =
        generateCalendarData(currentYear, currentMonth);
    // calendarData.add(additionalRowData);
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
            padding: const EdgeInsets.only(top: 20.0, left: 25.0),
            height: MediaQuery.of(context).size.height * 2,
            width: MediaQuery.of(context).size.width * 2,
            alignment: Alignment.topLeft,
            child: DataTable(
              border: TableBorder.all(width: 2.0),
              columns: daysOfWeek
                  .map((day) => DataColumn(
                      label: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 5.5,
                          child: Text(day))))
                  .toList(),
              rows: calendarData.map((week) {
                return DataRow(
                  cells: week.map((day) {
                    List<Widget> cells = [
                      Center(child: Text(day)),
                    ];

                    // 添加一行分隔内容
                    cells.add(const SizedBox(
                      height: 40, // 调整高度以适应内容
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(height: 1), // 分隔线
                          Expanded(
                            child: Center(
                              child: Text('Your Data'), // 在这里放置你的数据
                            ),
                          ),
                        ],
                      ),
                    ));

                    return DataCell(Column(
                      children: cells,
                    ));
                  }).toList(),
                );
              }).toList(),
              // calendarData.map((week) {
              //   // print(week);
              //   return
              //   DataRow(
              //     cells: week.map((day) {
              //       return DataCell(Column(
              //         children: [
              //           Center(child: Text(day)),
              //         ],
              //       ));
              //     }).toList(),
              // calendarData.map((week) {
              //   return DataRow(
              //     cells: week.map((day) {
              //       List<Widget> cells = [
              //         Center(
              //           child: Text(day),
              //         )
              //       ];
              //       cells.add(Container(
              //         height: MediaQuery.of(context).size.height / 4,
              //         child: Center(child: Text('Data')),
              //       ));
              //       return DataCell(Column(
              //         children: cells,
              //       ));
              //     }).toList(),
              //   );
              // }).toList()
              //   );
              // }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
