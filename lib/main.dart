import 'dart:async';

import "package:flutter/material.dart";

import "./pages/homepage.dart";
import "./pages/user_details.dart";

void main(){
  runApp(FlutterRefresherApp());
}

class FlutterRefresherApp extends StatelessWidget{


  Widget build(BuildContext context){

    return MaterialApp(
      title: "FlutterRefresherApp",
      routes: {
        "/": (ctx) => Homepage(),
        "user_details": (ctx) => UserDetails()
      },
      // initialRoute: "user_details",
      onGenerateTitle: (val) {
        print("valTitle: ${val}");

        return "aString";
      },
      onGenerateRoute: (val) {
        // print("valRoute: ${val}");
      },

    );
  }
}