import 'package:flutter/material.dart';
import 'package:medicare/screens/home.dart';
import 'package:medicare/screens/login/login.dart';
import 'package:medicare/screens/settings_screen.dart';
import 'package:medicare/tabs/HomeTab.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showpassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 1,
      leading: IconButton(
        
        icon: Icon(
         Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: () {
        Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
        icon: Icon(
         Icons.settings,
          color: Colors.blue,
          
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
        },
        ),
      ],
     ),
     body: Container(
      padding: EdgeInsets.only(left: 16,top: 25,right: 16),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();},
        child: ListView(
          children: [
            Text("Edit Profile",style: TextStyle(
              fontSize: 25,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,blurRadius: 10,
                            color: Colors.grey.withOpacity(0.1),
                            offset: Offset(0, 10)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/person.jpeg'),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.blue,
                      ),
                      child: Icon(Icons.edit, color: Colors.white,),
                      
                      ))
      
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name","Name",false),
              buildTextField("Email","@gmail,com",false),
              buildTextField("Password","********",true),
              buildTextField("Mobile Number","+92**********",false),
              SizedBox(
                height:35 ,

              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                   
                   style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                   ),
                    onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

                    },
                  child: Text("Cancle",
                  style: TextStyle(fontSize: 14, letterSpacing: 2.2,
                  color: Colors.white)), 
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed :(){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 2,
                        shape: StadiumBorder(),
                      ),
                      
                     
                      
                      child: Text("SAVE",style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white
                      ),
                      ),
                      
                    ),
                  )
                ],

              )
          ],
        ),
      )
     ),
    );
  }
  
   Widget buildTextField(String labelText,String placeholder,bool isPasswordTextField)  {
     return Padding(
            padding: const EdgeInsets.only(bottom :35.0),
            child: TextField(
              obscureText: isPasswordTextField ? showpassword:false,
                  decoration: InputDecoration(
                    suffixIcon: isPasswordTextField ? IconButton(
                      onPressed: () {
                        setState(() {
                         showpassword = !showpassword; 
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                      color: Colors.black,
                      ),
                    ): null,
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: labelText,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: placeholder,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 182, 170, 170),
                    ),
                  ),
  ),
          );
 }

}