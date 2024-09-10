import 'package:calculator_app/models/calculator_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalculatorService {
  final CollectionReference calculatorCollection =
      FirebaseFirestore.instance.collection('datas');

  Future<CalculatorDataModel?> addData(CalculatorDataModel data) async {
    try {
      final dataMap = data.toJson();
      await calculatorCollection.doc(data.id).set(dataMap);
      return data;
    } on FirebaseException catch (e) {
      print('Error adding data: ${e.message}');
      return null;
    }
  }
}
