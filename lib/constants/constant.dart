import 'package:flutter/material.dart';

const inputDec = InputDecoration(
    hintText: "Enter the Email",
    filled: true,
    contentPadding: EdgeInsets.all(20),
    //This is the padding for the content inside the textfield of the email
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    //This is for deleting the borders
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    fillColor: Color.fromARGB(255, 185, 203, 206));

// final rowInDrawer = Container(
  
//   padding: EdgeInsets.all(20),
//   child: ListTile(
//     leading: Icon(Icons.settings),
//   ),
// );
//What is the difference between ListTile and Row?
