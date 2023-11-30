import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('停車折抵'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: '請輸入車牌',
                  labelStyle: const TextStyle(fontSize: 24),
                  hintText: 'AAA-123',
                  hintStyle:
                      TextStyle(fontSize: 18, color: Colors.grey.shade400),
                  prefixIcon: const Icon(Icons.car_rental),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  print('測試折抵按鈕');
                },
                child: Text(
                  '折抵',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade600,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0),
              child: const Text(
                '車牌XXX-1234已折抵',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.only(left: 20.0, top: 25.0),
              alignment: Alignment.topLeft,
              child: const Text('單純測試大小'),
            ),
          ]),
        ),
      ),
    );
  }
}
