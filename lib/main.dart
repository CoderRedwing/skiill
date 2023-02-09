import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/home_page.dart';
import 'package:untitled1/screens/resister.dart';
import 'package:untitled1/screens/verify.dart';
import 'package:untitled1/welcome.dart';
import 'package:untitled1/widgets/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(  MaterialApp(
         debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
           'splash':(context)=>Welcome(),
      'resister':(context)=>Verify(),
      'verify':(context)=>HomePage(),
    },
       ));
}
