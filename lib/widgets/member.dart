import 'dart:convert';

import 'package:f_web/common/alert.dart';
import 'package:f_web/service/user_service.dart';
import 'package:f_web/screens/login.dart';
import 'package:f_web/util/restful.dart';
import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;

class Member extends StatefulWidget {
  const Member({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MemberState();
  }
}

class MemberState extends State<Member> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
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
                    'Register in to ',
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
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                width: 300,
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    hintText: '',
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 30.0,
                    ),
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
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                width: 300,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: '',
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 30.0,
                    ),
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
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      onPressed: _register,
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.pink,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {

    if (username.text == '') {
      alert(context, '请输入用户名', 60.0, 255, 230, 230, 250, 90.0, 20.0);
    } else if (password.text == '') {
      alert(context, '请输入密码', 60.0, 255, 230, 230, 250, 90.0, 20.0);
    } else if (phone.text == '') {
      alert(context, '请输入手机号', 60.0, 255, 230, 230, 250, 90.0, 20.0);
    } else if (email.text == '') {
      alert(context, '请输入邮箱', 60.0, 255, 230, 230, 250, 90.0, 20.0);
    } else {
      Map<String, dynamic> user = await _userService.register(
          username.text, password.text,phone.text,email.text);

      if (user == null) {
        print("there was an error");
      } else {
        _verificationAlert();
      }
    }
//      var res = await http.post('https://www.rojackse.top:10001/user/register', body: {
//        'username': username.text,
//        'password': password.text,
//        'phoneNumber': phone.text,
//        'email': email.text
//      });
//      var decodedJson = jsonDecode(res.body);
//      print(decodedJson);
//      if (res.statusCode == 200 && decodedJson != null) {
////        print('username:' + username.text);
////        print('password:' + password.text);
//
//        if(mounted) {
//          setState(() {
//            restful = Restful.fromJson(decodedJson);
//            print(restful);
//            if(restful.code == 1){
//              alert(context, restful.data, 60.0, 255, 230, 230, 250, 80.0, 20.0);
//            } else if(restful.code == 0){
//              alert(context, restful.msg, 60.0, 255, 230, 230, 250, 100.0, 20.0);
//              if(restful.msg == "ok") {
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => Login()
//                ));
//              }
//            }
//            loading = false;
//          });
//        }
//
//      } else {
//        print("Something went wrong");
//        if(mounted) {
//          setState(() {
//            loading = false;
//          });
//        }
//      }

  }

  void _verificationAlert() {
    var alert = new AlertDialog(
      content: ListTile(
        title: Text("Account created!"),
      ),
      actions: <Widget>[
        FlatButton(onPressed: () {
         Navigator.pushNamed(context, Login.routeName);

        }, child: Text('Yes'))
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

}
