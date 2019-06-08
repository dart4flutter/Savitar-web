import 'dart:convert' show json;
class PersonResp {
  int code;
  String msg;
  Person data;

  PersonResp.fromParams({this.code, this.msg, this.data});

  factory PersonResp(jsonStr) => jsonStr is String ? PersonResp.fromJson(json.decode(jsonStr)) : PersonResp.fromJson(jsonStr);

  PersonResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = new Person.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class Person {
  int age;
  String name;

  Person.fromParams({this.age, this.name});

  Person.fromJson(jsonRes) {
    age = jsonRes['age'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"age": $age,"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}
