import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'package:flutter/material.dart';
import 'package:untitled1/screens/home_page.dart';
import 'package:untitled1/welcome.dart';
class SplashServices{
  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user !=null){
      Timer(const Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage())));
    }
    else{
      Timer(const Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>const Welcome(),)));
    }
  }

}
