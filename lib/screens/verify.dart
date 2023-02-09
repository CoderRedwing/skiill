import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled1/screens/home_page.dart';
import 'package:untitled1/screens/resister.dart';

class Verify extends StatefulWidget {

  const Verify({Key? key, }) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final verifyController = TextEditingController();
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code="";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.deepPurple,),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Image.asset('images/hhhh.png',scale: 0.5,),
                const Text('Phone verification',style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                const Text('You need to resister first ',style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 17,

                ),),

                SizedBox(height: 30,),
                     Pinput(
                     controller: verifyController,
                      length: 6,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                      onChanged: (value){
                        code=value;
                      },

          ),
                const SizedBox(height: 40,),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async {

                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Resister.verify, smsCode: code);
                      await auth.signInWithCredential(credential);
                      Navigator.pushAndRemoveUntil(context, 'verify', (route) => false)
                    }catch(e){

                    print('wrong otp');
                    }

                    },

                    child: Text('Verify code'),style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )


                    ),),
                ),
                SizedBox(height: 15,),
                Row(children: [
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Resister()));
                  }, child: const Text('Edit Phone Number?',
                    style: TextStyle(fontSize: 16,color:Colors.deepPurple),)),
                ],)


              ],
            )),
      ),
    );
  }
}