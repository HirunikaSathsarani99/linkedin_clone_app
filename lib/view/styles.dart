import 'package:flutter/material.dart';

class AppStyles {
  static const Color primaryColor = Color.fromARGB(255, 19, 119, 201); 
  static const Color iconColor=Color.fromARGB(255, 214, 212, 212);
  //screen Size
   static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  
}