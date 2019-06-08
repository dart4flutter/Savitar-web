import 'dart:convert' show json;
import 'dart:convert' as prefix0;

import 'package:f_web/model/BaseResp.dart';
import 'package:f_web/model/PersonResp.dart';
import 'package:f_web/model/user.dart';
import 'package:f_web/util/restful.dart';
import 'package:f_web/widgets/data.dart';
import 'package:http/http.dart' as http;

void main () async{
  var json = person[0]['name'];
  print(json);


  String test = '{"code": 200,"data": "{\"username\":"123",\"role\":1,\"phoneNumber\":"123",\"email\":"123",\"avatar\": null,\"avatarPath\": null}","msg": "用户信息"}';
  User user = BaseResp<User>(result[0], (res) => User.fromJson(res)).data;
  print(result);
  print(result[0]);
  print(user);
  print(user.username);

  String body = '{"code":200,"data":"{\"username\":123,\"role\":1,\"phoneNumber\":123,\"email\":123,\"avatar\": null,\"avatarPath\": null}","msg":"用户信息"}';

  print(body.replaceAll("\\","").replaceRange(19, 20, ""));
  print(body.replaceAll("\\","").replaceRange(19, 20, "").replaceRange(108, 109, ""));

  Map<String,String> temp = {"username":"123","role":"1","phoneNumber":"123","email":"123","avatar": null,"avatarPath": null};

  User we = User.fromJson(temp);

  print(we.avatar);

}