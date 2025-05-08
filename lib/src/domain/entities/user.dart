import 'package:udece_app/src/domain/entities/commons/location.dart';

// rol: passenger, driver
enum UserRole { passenger, driver }

class User {
  String uuid;
  int codeUniversity;
  String name;
  int phone;
  String email;
  String password;
  UserRole role;
  String photo;
  Location location;
  String headquarterId;

  User({
    required this.uuid,
    required this.name,
    required this.phone,
    required this.password,
    required this.role,
    required this.photo,
    this.codeUniversity = 0,
    required this.email,
    required this.location,
    required this.headquarterId,
  });
}
