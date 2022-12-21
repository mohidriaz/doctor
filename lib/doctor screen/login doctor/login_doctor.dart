import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screens/home.dart';
import 'package:medicare/screens/login/classes/fadeanimation.dart';
import '../../screens/login/classes/hex_color.dart';
import 'package:medicare/doctor%20screen/login%20doctor/signup_doc.dart';
import 'package:medicare/doctor%20screen/login%20doctor/forgot_passworddoc.dart';
import 'package:medicare/doctor%20screen/screens_doc/Home_page.dart';

enum FormData {
  Email,
  password,
}

class LoginScreenDoc extends StatefulWidget {
  
  @override
  State<LoginScreenDoc> createState() => _LoginScreenDocState();
}

class _LoginScreenDocState extends State<LoginScreenDoc> {
  final _auth = FirebaseAuth.instance;
  Color enabled = Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = Colors.white;
  bool ispasswordev = true;
  FormData? selected;

  final formKey = GlobalKey<FormState>();
  var email="";
  var password="";

  final emailController = TextEditingController();
  final passwordController =  TextEditingController();
userLogin() async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword
      (email: email, password: password);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Text("Logged in",
            style: TextStyle(fontSize: 12.0),),
        )
    );
    Navigator.pushReplacement(context, MaterialPageRoute
      (builder: (context)=>homescreendoc(),
    ),
    );
  }on FirebaseAuthException catch(e) {
    if(e.code== 'user-not-found'){
      print("No User Found");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("No User Found",
              style: TextStyle(fontSize: 12.0),),
          )
      );
    }
    else if (e.code=='wrong-password'){
      print("Wrong Password Provided by User");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Wrong Password",
              style: TextStyle(fontSize: 12.0),),
          )
      );
    }
  }
}
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
 if (formkey.currentState!.validate()) {

      showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: AlertDialog(
                        title: Text(
                          "Account Sucessfully Login ",
                          style: TextStyle(fontSize:15),

                        ),
                        icon: Icon(
                          Icons.check_circle_outline,
                          size: 60,
                        ),
                        iconColor: Color.fromARGB(255, 3, 82, 5),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Home();
                                }));
                              },
                              child: Text(
                                "Continue to Homepage",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ))
                        ],
                      ),
                    );
                  });

    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                HexColor("#4b4293").withOpacity(0.8),
                HexColor("#4b4293"),
                HexColor("#08418e"),
                HexColor("#08418e")
              ],
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
              image: const NetworkImage(
                'https://mir-s3-cdn-cf.behance.net/project_modules/fs/01b4bd84253993.5d56acc35e143.jpg',
              ),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    color: Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeAnimation(
                            delay: 0.8,
                            child: Image.network(
                              "https://cdni.iconscout.com/illustration/premium/thumb/job-starting-date-2537382-2146478.png",
                              width: 180,
                              height: 180,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: const Text(
                              "Please sign in to continue",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.Email
                                    ? enabled
                                    : backgroundColor,
                              ),
                              padding: const EdgeInsets.only(top:10.0),
                              child: TextFormField(
                                controller: emailController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.Email;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: selected == FormData.Email
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12),
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    color: selected == FormData.Email
                                        ? enabledtxt
                                        : deaible,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                   validator: (value) {
                                  if (value!.isEmpty) {
                                    return "  *Required";
                                  } else if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return '  *Please a valid Email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: selected == FormData.password
                                      ? enabled
                                      : backgroundColor),
                              padding: const EdgeInsets.only(top:10.0),
                              child: TextFormField(
                                controller: passwordController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.password;
                                  });
                                },
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.lock_open_outlined,
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: ispasswordev
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: selected == FormData.password
                                                  ? enabledtxt
                                                  : deaible,
                                              size: 20,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: selected == FormData.password
                                                  ? enabledtxt
                                                  : deaible,
                                              size: 20,
                                            ),
                                      onPressed: () => setState(
                                          () => ispasswordev = !ispasswordev),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : deaible,
                                        fontSize: 12)),
                                obscureText: ispasswordev,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    color: selected == FormData.password
                                        ? enabledtxt
                                        : deaible,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                    validator: (value) {
                                  if (value!.isEmpty) {
                                    return "  *Required";
                                  } else if (value.length < 8) {
                                    return "  *At Least 8 characters Required";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: TextButton(
                                onPressed:(){
                                  if(formkey.currentState!.validate()){
                                    setState(() {
                                      email = emailController.text;
                                      password = passwordController.text;
                                    });
                                    userLogin();
                                  }},

                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF2697FF),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 80),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0)))
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //End of Center Card
                  //Start of outer card
                  const SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ForgotPassworddocScreen();
                        }));
                      }),
                      child: Text("Can't Log In?",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            letterSpacing: 0.5,
                          )),
                    ),
                  ),
                  SizedBox(height: 10),

                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SignupdocScreen();
                            }));
                          },
                          child: Text("Sign up",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
