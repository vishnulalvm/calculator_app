import 'package:cloud_firestore/cloud_firestore.dart';

class CalculatorDataModel {
  String? id;
  String? activityLevel;
  String? gender;
  String? feet;
  String? inch;
  String? weight;
  String? age;
  int? status;
  String? tdee;
  DateTime? dateTime;
  CalculatorDataModel(
      {this.activityLevel,
      this.tdee,
      this.age,
      this.dateTime,
      this.feet,
      this.gender,
      this.id,
      this.inch,
      this.status,
      this.weight});

  factory CalculatorDataModel.fromJson(DocumentSnapshot data) {
    return CalculatorDataModel(
      activityLevel: data['activity'],
      tdee: data['tdee'],
      age: data['age'],
      feet: data['feet'],
      inch: data['inch'],
      id: data['id'],
      gender: data['gender'],
      weight: data['weight'],
      dateTime: (data['datetime'] as Timestamp?)?.toDate(),
      status: data['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "tdee": tdee,
      "age": age,
      "activity": activityLevel,
      "feet": feet,
      "inch": inch,
      "datetime": dateTime != null ? Timestamp.fromDate(dateTime!) : null,
      "id": id,
      "gender": gender,
      "weight": weight,
      "status": status,
    };
  }
}
