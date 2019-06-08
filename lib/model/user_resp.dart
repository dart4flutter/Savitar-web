import 'dart:convert' show json;
class UserResp {
  int code;
  String msg;
  User data;

  UserResp.fromParams({this.code, this.msg, this.data});

  factory UserResp(jsonStr) => jsonStr is String ? UserResp.fromJson(json.decode(jsonStr)) : UserResp.fromJson(jsonStr);

  UserResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = new User.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class User {
  String username;
  int role;
  String phoneNumber;
  String email;
  String avatar;
  String avatarPath;

  User({this.username,
    this.role,
    this.phoneNumber,
    this.email,
    this.avatar,
    this.avatarPath});

  User.fromJson(jsonRes) {
    username = jsonRes['username'];
    role = num.parse(jsonRes['role']);
    phoneNumber = jsonRes['phoneNumber'];
    email = jsonRes['email'];
    avatar = jsonRes['avatar'];
    avatarPath = jsonRes['avatarPath'];

  }

  @override
  String toString() {
    return '{"username":${username != null?'${json.encode(username)}':'null'},"role":${role != null?'${json.encode(role)}':'null'},"phoneNumber":${phoneNumber != null?'${json.encode(phoneNumber)}':'null'},"email":${email != null?'${json.encode(email)}':'null'},"avatar": ${avatar !=null?'${json.encode(avatar)}':'null'},"avatarPath": ${avatar !=null?'${json.encode(avatar)}':'null'}}';
  }
}
