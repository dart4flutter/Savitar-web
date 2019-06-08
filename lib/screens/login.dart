import 'package:flutter_web/material.dart';
import '../widgets/leftSide.dart';
import '../widgets/rightSide.dart';

class Login extends StatelessWidget {
  static const String routeName = '/';
  const Login({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)),
        elevation: 5.0,
        child: Container(
          height: 500,
          width: 1000,
          child: Row(
            children: <Widget>[
              new LeftSide(),
              new RightSide()
            ],
          ),
        ),
      ),
    );
  }
}

