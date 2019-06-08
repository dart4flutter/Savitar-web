import 'package:f_web/widgets/member.dart';
import 'package:flutter_web/material.dart';

class Register extends StatelessWidget {
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logo__invision--white.png'),
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            height: 800,
            width: 800,
            child: Row(
              children: <Widget>[
                new Member(),
              ],
            ),
          ),
        ),
      )
    );
  }
}