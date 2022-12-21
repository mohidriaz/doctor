import 'package:flutter/material.dart';
import 'package:medicare/screens/login/classes/fadeanimation.dart';
import 'package:medicare/screens/login/login.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset("assets/269.png",width: 420,height: 420,),
         
    SizedBox(height: 10,
),
Text("Welcome",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 32) ,),
SizedBox(height: 0,),
          Text("Patient",style:TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 22) ,),
          SizedBox(height: 0,),
Text("To",style: TextStyle(color: Colors.blueGrey, fontSize: 15),), 
SizedBox(height: 0,),
Text("Doctor Appoinment App",style: TextStyle(color: Colors.blueGrey, fontSize: 15),), 
SizedBox(height: 5,),
  FadeAnimation(
  delay: 2,
  child: TextButton(
  onPressed:(){
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) {
  return LoginScreen();
      }
    ),
   );
  },
         child: Text(
         "Get Started",
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