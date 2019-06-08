import 'dart:async';
import 'package:f_web/model/BaseResp.dart';
import 'package:f_web/model/user_resp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class UserService{
  Future register(String username, String password, String phoneNumber, String email)async{
    String url = "https://www.rojackse.top:8080/user/register";
    http.Response response = await http.post(url,body: {
      'username': username,
      'password': password,
      'phoneNumber': phoneNumber,
      'email': email
    });
    Map<String, dynamic> body = jsonDecode(response.body);
    return body;
  }

  Future login(String username, String password)async{
    String url = "https://www.rojackse.top:8080/auth/login";
    http.Response response = await http.post(url,body: {
      'username': username,
      'password': password,
    });
    Map<String, dynamic> body = jsonDecode(response.body);
    return body;
  }

  Future getUserInfo(String token) async {
    String url = "https://www.rojackse.top:8080/user/info";
    http.Response response = await http.post(url,body: {'token':token});
    Map<String, dynamic> body = jsonDecode(response.body);
    return body;
  }
}