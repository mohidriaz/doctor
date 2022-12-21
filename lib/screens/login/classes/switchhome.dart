import 'package:flutter/material.dart';
import 'package:medicare/screens/login/classes/fadeanimation.dart';
import 'package:medicare/screens/login/login.dart';
import 'package:medicare/screens/login/classes/welcom.dart';

import '../../../doctor screen/welcome.dart';
class SwitchHome extends StatelessWidget {
  const SwitchHome({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset("assets/doctor.png",width: 3600,height: 360,),
          SizedBox(height: 0,),
      Padding(
        padding: const EdgeInsets.only(right:200),
        child: Text("Welcome",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 35,) ,),
      ),
      SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(right:130),
            child: Text("Now it is easier for patients",style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
          ),
          Padding(
            padding: const EdgeInsets.only(right:80),
            child: Text("who want to consult with a doctor",style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
          ),
          SizedBox(height: 30,),

          Text("Select",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 22,) ,),
          SizedBox(height: 0,),
          Text("To continue as !",style: TextStyle(color: Colors.blueGrey, fontSize: 10),),
          SizedBox(height:3,),

  FadeAnimation(
  delay: 3,
  child: TextButton(
  onPressed:(){
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) {
  return WelcomeScreen();
      }
    ),
   );
  },
         child: Text(
         "Patient",
          style: TextStyle(
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
            ),
           ),
            style: TextButton.styleFrom(
             backgroundColor: Colors.blue,
             padding: const EdgeInsets.symmetric(
             vertical: 14.0, horizontal: 80),
            shape: RoundedRectangleBorder(
            borderRadius:
             BorderRadius.circular(12.0)
              )
             )
           ),
         ),
          SizedBox(height: 15,),
          FadeAnimation(
            delay: 6,
            child: TextButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return WelcomeScreenDoctor();
                    }
                    ),
                  );
                },
                child: Text(
                  "Doctor",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 80),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12.0)
                    )
                )
            ),
          ),
        ],
      ) ,
    );
  }
}