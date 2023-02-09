import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/verify.dart';

class Resister extends StatefulWidget {
  const Resister({Key? key}) : super(key: key);
  static String verify="";

  @override
  State<Resister> createState() => _ResisterState();
}

class _ResisterState extends State<Resister> {
  TextEditingController countryCode=TextEditingController();
  final phoneNumberController=TextEditingController();
  final auth = FirebaseAuth.instance;
  var phone="";
  @override
  void initState() {
    countryCode.text="+91";
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  decoration: BoxDecoration(

                    border: Border.all(width: 1.5,color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 40,
                        child: TextFormField(
                          controller: countryCode,
                          decoration: const InputDecoration(

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12,),
                      const Text('|',style: TextStyle(fontSize: 35,color: Colors.deepPurple),),
                      Expanded(

                        child: TextFormField(
                          onChanged: (value){
                            phone=value;
                          },
                            controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone',

                        ),),
                      ),
                    ],
                  ),
                ),
                    const SizedBox(height: 40,),
                   SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countryCode.text+phone}',
                        verificationCompleted: (_) {},
                        verificationFailed: ( e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Resister.verify=verificationId;
                          Navigator.pushNamed(context, 'verify');
                        },
                        codeAutoRetrievalTimeout: (e) {},
                      );

                    },
                      child: Text('Get otp',),style: ElevatedButton.styleFrom(

                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )


                      ),),
                  ),


              ],
            )),
      ),
    );
  }
}

