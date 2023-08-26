class UserModel {
  UserModel({
    required this.email,
    required this.photo,
    required this.username,
    required this.display_name,
  });
  late String email;
  late String photo;
  late String username;
  late String display_name;

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    photo = json['photo'] ?? '';
    username = json['username'] ?? '';
    display_name = json['display name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['photo'] = photo;
    _data['username'] = username;
    _data['display name'] = display_name;
    return _data;
  }
}
//format to use
/*
{ 
"email" :  "ajaya@gmail.com",
 "photo" : "fasdasf",
 "username" : "ajaya",
 "display name"  : "ajaya timsina"} 
*/