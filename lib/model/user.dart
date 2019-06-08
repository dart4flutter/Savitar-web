class User {
  String username;
  int role;
  String phoneNumber;
  String email;
  String avatar;
  String avatarPath;

  User(
      {this.username,
      this.role,
      this.phoneNumber,
      this.email,
      this.avatar,
      this.avatarPath});
  User.fromJson(json)
      : username = json['username'],
        role = num.parse(json['role']),
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        avatar = json['avatar'],
        avatarPath = json['avatarPath'];

  User forMap(Map map) =>new User()
    ..username=map['username']
    ..role=map['role']
    ..phoneNumber=map['phoneNumber']
    ..email=map['email'].replaceAll('@', '#')
    ..avatar=map['avtar']
    ..avatarPath=map['avatarPath'].toString();//格式化输入
}
