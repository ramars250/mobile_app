import 'package:flutter/material.dart';
import 'package:mobile_app/discount_view.dart';
import 'package:mobile_app/login_view.dart';
import 'package:mobile_app/schedule_view.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key, required this.title});

  final String title;

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginView()));
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body:
          // const LoginView(),
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '尚未登入，請先點擊右上角登入',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('功能列表'),
            ),
            ListTile(
              title: const Text('部門班表'),
              // selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ScheduleView()));
              },
            ),
            ListTile(
              title: const Text('停車折抵'),
              // selected: _selectedIndex == 1,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Discount()));
              },
            ),
            ListTile(
              title: const Text('School'),
              // selected: _selectedIndex == 2,
              onTap: () {
                print('測試功能按鈕3');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
