import 'package:clothingapp/bottom_nav_controller.dart';
import 'package:clothingapp/sign_up.dart';
import 'package:clothingapp/tab_cont.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _passCont = TextEditingController();

  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailCont.text, password: _passCont.text);
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        //  Navigator.push(context, MaterialPageRoute(builder: (_) => TabBarrr()));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => BottomComtroller()),
            (Route<dynamic> route) => false);
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Container(
                    height: 207.h,
                    width: 170.w,
                    child: Image.asset(
                      "assets/images/Vectors.png",
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 500.h,
                      width: 380.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 5)],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: 250.w,
                            child: TextField(
                              controller: _emailCont,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(240, 240, 240, 1),
                                hintText: "enter email",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.person,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(240, 240, 240, 1),
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(240, 240, 240, 1))),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 250.w,
                          child: TextField(
                            controller: _passCont,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(240, 240, 240, 1),
                              hintText: "password",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.lock,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(240, 240, 240, 1),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(240, 240, 240, 1))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              signIn();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => BottomComtroller()));
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(120, 40),
                                primary: Color.fromRGBO(254, 37, 80, 1)),
                            child: Text("Login")),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(180, 40),
                                primary: Color.fromRGBO(254, 37, 80, 1)),
                            child: Text("Login with gmail")),
                        SizedBox(
                          height: 25.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => SignUp()));
                          },
                          child: Text(
                            "Create Account",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
