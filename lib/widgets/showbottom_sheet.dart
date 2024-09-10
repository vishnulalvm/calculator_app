import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/models/calculator_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowbottomSheet {
  static showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,

      useSafeArea: true,
      context: context,
      isScrollControlled: true, // Allows the sheet to expand fully
      backgroundColor: Colors.transparent, // To allow custom decoration
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Container(
          color: APPColors.secondary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.drag_handle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8), // Space between icon and content
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
              // Content of the bottom sheet
              Expanded(
                child: Column(
                  children: [
                    const Text("New Datas"),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('datas')
                            .snapshots(),
                        builder: (context, snapshort) {
                          if (snapshort.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshort.hasError) {
                            return const Expanded(
                              child: Center(
                                child: Text(
                                  "Some Error Occurse",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                          if (snapshort.data!.docs.isEmpty) {
                            return const Expanded(
                              child: Center(
                                child: Text(
                                  "No Data",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                          if (snapshort.hasData &&
                              snapshort.data!.docs.isNotEmpty) {
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshort.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    // CalculatorDataModel calculatorData = CalculatorDataModel();
                                    final data = CalculatorDataModel.fromJson(snapshort.data!.docs[index]);
                                    return ListTile(
                                      title: Text("${data.tdee}",style: const TextStyle(color: Colors.white),),
                                      subtitle: const Text("hi",style: TextStyle(color: Colors.white),),
                                      leading: Text("${data.age}",style: const TextStyle(color: Colors.white),),
                              
                                    );
                                  }),
                            );
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
