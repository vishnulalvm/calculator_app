  import 'package:calculator_app/constants/colors.dart';
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
                  icon: const Icon(Icons.close,color: Colors.white,),
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
                     ListView.builder(
                      shrinkWrap: true,
                       itemCount: 10,
                       itemBuilder: (context , index){
                       
                       return const ListTile(
                         tileColor: Colors.white,
                         textColor: Colors.amber,
                         leading: Text("1"),
                         title: Text("data"),
                         subtitle: Text("new data da"),
                         
                       );
                     }),
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
