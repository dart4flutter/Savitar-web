import 'dart:convert' show json;

class BaseResp<T> {
  int code;
  String msg;
  T data;

  factory BaseResp(jsonStr, Function buildFun) =>
      jsonStr is String ? BaseResp.fromJson(json.decode(jsonStr), buildFun) : BaseResp.fromJson(jsonStr, buildFun);

  BaseResp.fromJson(jsonRes, Function buildFun) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    /// 这里可以做code和msg的处理逻辑
    data = buildFun(jsonRes['data']);
  }
}

class BaseRespList<T> {
  int code;
  String msg;
  List<T> data;

  factory BaseRespList(jsonStr, Function buildFun) => jsonStr is String
      ? BaseRespList.fromJson(json.decode(jsonStr), buildFun)
      : BaseRespList.fromJson(jsonStr, buildFun);

  BaseRespList.fromJson(jsonRes, Function buildFun) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];

    _check(code, msg);

    data = (jsonRes['data'] as List).map<T>((ele) => buildFun(ele)).toList();
  }
}

/// 这里可以做code和msg的处理逻辑
void _check(int code, String msg) {}