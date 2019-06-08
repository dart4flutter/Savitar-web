import 'dart:convert';

import 'package:f_web/common/alert.dart';
import 'package:f_web/model/BaseResp.dart';
import 'package:f_web/model/user.dart';
import 'package:f_web/service/user_service.dart';
import 'package:f_web/screens/dash_board.dart';
import 'package:f_web/screens/register.dart';
import 'package:f_web/util/restful.dart';
import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;

class RightSide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<RightSide> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  UserService _userService = UserService();
  Restful restful;
  bool loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign in to ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1),
                  ),
                  Text(
                    'InVision',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.pink,
                        letterSpacing: 2),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Enter your details below',
                    style: TextStyle(color: Colors.grey),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                width: 300,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: '',
                    icon: Image.asset('images/user.png'),
                    // prefix: Image.asset('images/user.png'),
                    // prefixIcon: Icon(Icons.person),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey)),
                    enabledBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey)),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Image.asset('images/closed-lock.png'),
                    // prefix: Image.asset('images/closed-lock.png'),
                    // prefixIcon: Icon(Icons.person),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey)),
                    enabledBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey)),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      onPressed: _login,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    OutlineButton(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Register.routeName);
//                        Navigator.push(
//                          //跳转到第二个界面
//                          context,
//                          MaterialPageRoute(builder: (context) => Register()),
//                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.only(top: 20),
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/facebook.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('images/youtube.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('images/twitter.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('images/github.png'),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (username.text == '') {
      alert(context, '请输入用户名', 60.0, 255, 230, 230, 250, 90.0, 20.0);
    } else if (password.text == '') {
      alert(context, '请输入密码', 60.0, 255, 230, 230, 250, 90.0, 20.0);
    } else {
      Map<String, dynamic> result = await _userService.login(username.text, password.text);
      if (result == null) {
        print("there was an error");
      } else {
        _verificationAlert(result);
      }
    }
  }

  void _verificationAlert(result) async {
    print(result);
    var json = new Restful.fromJson(result);
    Map<String, dynamic> info = await _userService.getUserInfo(json.data);
    print(info);
    var resultMap = new Restful.fromJson(info);
    print(resultMap.code);
    print(resultMap.msg);
    print(resultMap.data);

    String test = resultMap.data;
    test.replaceAll(new RegExp(r'"{'), '{').replaceAll(new RegExp(r'}"'), '}');
    print(test);

    User user = User.fromJson(jsonDecode(test));
    print(user.username);

    String email = user.email != null ? user.email.replaceAll("#", "@") : null;
    print(email);

    bool value = await Navigator.push(context, MaterialPageRoute<bool>(
        builder: (BuildContext context) {
          return Center(
            child: GestureDetector(
                child: Text('Login Successfully!'),
                onTap: () {
                  Navigator.pop(context, true);
                  Navigator.pushNamed(context, DashBoard.routeName);
                }
            ),
          );
        }
    ));

    if (value == true) {
//      await Navigator.pushNamed(context, DashBoard.routeName);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DashBoard(
                    username: user.username,
                    email: email
                  )
          )
      );
    }
  }
}