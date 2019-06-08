
import 'package:f_web/screens/dash_board.dart';
import 'package:f_web/screens/login.dart';
import 'package:f_web/screens/not_found.dart';
import 'package:f_web/screens/register.dart';
import 'package:flutter_web/material.dart';

class InVisionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InVasion Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: "Lato",
      ),
      // MaterialApp contains our top-level Navigator
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MyHomePage(title: 'InVision'),
        '/signup': (BuildContext context) => Register(),
        '/dashboard': (context,{username,email}) => DashBoard(username:username,email: email)
      },
      onUnknownRoute: (RouteSettings setting) {
        String name = setting.name;
        print("onUnknownRoute:$name");
        return new MaterialPageRoute(builder: (context) {
          return new NotFoundPage();
        });
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        // title: Text(title),
        title: Image.asset('images/logo__invision--white.png'),
      ),
      body: new Login(),
    );
  }
}
