import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 32),
        child: Column(
          children: [
              Image.asset('images/undraw_Welcome_re_h3d9.png'),
            const SizedBox(height: 20,),
            const Text('Get started',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.deepPurple,
            ),)
          ],

        ),
      ),
    );
  }
}

