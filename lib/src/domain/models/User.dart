import 'package:GsTravel/src/domain/models/Roles.dart';

class User {
  int? id;
  String name;
  String lastname;
  String? email;
  String phone;
  String? password;
  String? image;
  String? notificationToken;
  List<Roles>? roles;

  User({
    this.id,
    required this.name,
    required this.lastname,
    this.email,
    required this.phone,
    this.password,
    this.image,
    this.notificationToken,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"] ?? '',
        password: json["password"] ?? '',
        notificationToken: json["notification_token"] ?? '',
        roles: json["roles"] != null
            ? List<Roles>.from(json["roles"].map((x) => Roles.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
        "password": password,
        "notification_token": notificationToken,
        "roles": roles != null
            ? List<dynamic>.from(roles!.map((x) => x.toJson()))
            : [],
      };
}
