import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? password;
  DateTime? createdAt;
  int? status;
  String? uid;

  UserModel({this.email, this.password, this.createdAt, this.status, this.uid});

  factory UserModel.fromJson(DocumentSnapshot data) {
    return UserModel(
      email: data['email'],
      uid: data['uid'],
      createdAt: data['createdAt'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "password": password,
      "status": status,
      "createdAt": createdAt,
    };
  }
}
