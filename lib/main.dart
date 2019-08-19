import 'package:firebase_more/pages/welcome.dart';



import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      title: "login",
      home: Welcome(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    )
  );
}