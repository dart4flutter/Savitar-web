import 'dart:convert' show json;
class PhoneResp {
  int code;
  String msg;
  Phone data;

  PhoneResp.fromParams({this.code, this.msg, this.data});

  factory PhoneResp(jsonStr) => jsonStr is String ? PhoneResp.fromJson(json.decode(jsonStr)) : PhoneResp.fromJson(jsonStr);

  PhoneResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = new Phone.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class Phone {
  int price;
  String model;

  Phone.fromParams({this.price, this.model});

  Phone.fromJson(jsonRes) {
    price = jsonRes['price'];
    model = jsonRes['model'];
  }

  @override
  String toString() {
    return '{"price": $price,"model": ${model != null?'${json.encode(model)}':'null'}}';
  }
}
