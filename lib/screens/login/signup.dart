import 'package:flutter/material.dart';
import 'package:medicare/screens/login/classes/fadeanimation.dart';
import 'package:medicare/screens/login/classes/hex_color.dart';
import 'package:medicare/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum FormData { Name, Email,password, ConfirmPassword }

class SignupScreen extends StatefulWidget {

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Color enabled = Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;

  FormData? selected;
  final formKey = GlobalKey<FormState>();
var email="";
var password="";
var confirmpassword="";
  final nameController =  TextEditingController();
  final emailController = TextEditingController();
  final passwordController =  TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  registration()async{
    if(password == confirmpassword){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
            password: password);
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Text("Registration Successfully.Logged in..",
              style: TextStyle(fontSize: 12.0),),
          )
        );
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen(),
        ),
        );
      }
      on FirebaseAuthException catch (e) {


         if(e.code =='email-already-in-use'){
          print("Account already exits");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Account already exits",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          );
        }
      }
    }
    else{
      print("password and confirm password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("password and confirm password doesn't match",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      );

    }
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
                          "Account Created Sucessfully ",
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
                                  return LoginScreen();

                    }));
                              },
                              child: Text(
                                "Continue to Sigin",
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
                      padding: EdgeInsets.all(20.0),
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
                            child: Container(
                              child: Text(
                                "Create your account",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    letterSpacing: 0.5),
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
                                color: selected == FormData.Email
                                    ? enabled
                                    : backgroundColor,
                              ),
                              padding: const EdgeInsets.only(top: 10.0),
                              child: TextFormField(
                                controller: nameController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.Name;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.title,
                                    color: selected == FormData.Name
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.Name
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12),
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    color: selected == FormData.Name
                                        ? enabledtxt
                                        : deaible,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                    validator: ((value) {
                                      if(value!.isEmpty)
                                      {
                                        return "  *Required";
                                      }
                                      else {
                                        return null;
                                      }
                                    }),
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
                                color: selected == FormData.Email
                                    ? enabled
                                    : backgroundColor,
                              ),
                              padding: const EdgeInsets.only(top: 10.0),
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
                                  if (value== null ||value!.isEmpty) {
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
                              padding: const EdgeInsets.only(top: 10.0),
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
                                  color: selected == FormData.ConfirmPassword
                                      ? enabled
                                      : backgroundColor),
                              padding: const EdgeInsets.only(top:10.0),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.ConfirmPassword;
                                  });
                                },
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.lock_open_outlined,
                                      color: selected == FormData.ConfirmPassword
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: ispasswordev
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: selected ==
                                                      FormData.ConfirmPassword
                                                  ? enabledtxt
                                                  : deaible,
                                              size: 20,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: selected ==
                                                      FormData.ConfirmPassword
                                                  ? enabledtxt
                                                  : deaible,
                                              size: 20,
                                            ),
                                      onPressed: () => setState(
                                          () => ispasswordev = !ispasswordev),
                                    ),
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(
                                        color:
                                            selected == FormData.ConfirmPassword
                                                ? enabledtxt
                                                : deaible,
                                        fontSize: 12)),
                                obscureText: ispasswordev,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    color: selected == FormData.ConfirmPassword
                                        ? enabledtxt
                                        : deaible,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                  validator: (value) {
                                  if (value == null ||value!.isEmpty) {
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
                          SizedBox(
                            height: 25,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: TextButton(
                                onPressed:(){
                                  if(formkey.currentState!.validate()){
                                    setState(() {
                                      email = emailController.text;
                                      password = passwordController.text;
                                      confirmpassword= confirmPasswordController.text;
                                    });
                                    registration();
                                  }
                                },

                                child: Text(
                                  "Sign Up",
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
                                            BorderRadius.circular(12.0)))),
                          ),
                        ],
                      ),
                    ),
                  ),
      
                  //End of Center Card
                  //Start of outer card
                  SizedBox(
                    height: 20,
                  ),

                  FadeAnimation(
                  
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("If you have an account ",
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: Text("Sign in",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 14)
                                  ),
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
