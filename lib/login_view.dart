import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('登入'),
      ),
      body: Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _userNameController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "使用者帳號",
                hintText: "請輸入工號",
                icon: Icon(Icons.person),
              ),
              // 校验用户名
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _pwdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "驗證碼",
                hintText: "請輸入身分證末5碼",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              //校验密码
              validator: (v) {
                return v!.trim().length > 4 ? null : "驗證碼不能少于5位";
              },
            ),
            // 登录按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("登入"),
                      ),
                      onPressed: () {
                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if ((_formKey.currentState as FormState).validate()) {
                          //验证通过提交数据
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: const Text('登入'),
  //     ),
  //     body: const Center(
  //       child: Column(
  //         children: [
  //           TextField(
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //               labelText: '使用者帳號',
  //               hintText: '請輸入工號',
  //               prefixIcon: Icon(Icons.person),
  //             ),
  //           ),
  //           TextField(
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //               labelText: '驗證碼',
  //               hintText: '請輸入身分證末5碼',
  //               prefixIcon: Icon(Icons.lock),
  //             ),
  //             obscureText: true,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
