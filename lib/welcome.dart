import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/resister.dart';
import 'package:untitled1/widgets/round_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor:Colors.white ,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 50,),
              Image.asset('images/undraw_Welcome_re_h3d9.png'),
            const SizedBox(height: 20,),
            const Text('Get started',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.deepPurple,
            ),),
            const Text('Welcome to our community',style: TextStyle(

              fontSize: 15,
              color: Colors.deepPurple,
            ),),
            const SizedBox(height: 35,),
            RoundButton(
                title: 'Resister',

                onTap: (){
                  Navigator.pushNamed(context, 'resister');
                },

            ),
            const SizedBox(height: 10,),
            const Text('or'),
            const SizedBox(height: 10,),
            RoundButton(title: 'Login', onTap: (){}),

          ],

        ),
      ),
    );
  }
}

