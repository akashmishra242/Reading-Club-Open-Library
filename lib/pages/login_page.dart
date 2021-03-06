import 'package:flutter/material.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:reading_club_open_library/pages/landing_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  late String UserName = "";
  //const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final formkey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  static const String imageUrl =
      "https://cdn-icons-png.flaticon.com/512/295/295128.png";
  bool changeButton = false;
  bool eyeopen = false;
  bool isDigit = false;
  num changeColor = 1;
  String username = "";
  bool entry = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;

        (VxState.store as MyStore).loginPage.UserName = username; //imp
      });
      //UserName= username.text.toString();

      for (var i = 0; i < 10; i++) {
        changeColor = changeColor * (-1);
        entry == false ? entry = true : entry = false;
        await Future.delayed(Duration(milliseconds: 100));
        setState(() {});
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      //color: Colors.teal.shade50,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  scale: 1.5,
                  alignment: Alignment.topCenter,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "UserName",
                          hintText: "Enter UserName",
                          labelStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // color: Colors.teal,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.yellow.shade900,
                            size: 30,
                          ),
                        ),
                        validator: (value) {
                          username = value.toString();
                          if (value!.isEmpty) {
                            return "UserName can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          obscureText: eyeopen == false ? true : false,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Password",
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              //  color: Colors.teal,
                            ),
                            prefixIcon: Icon(Icons.lock,
                                color: Colors.yellow.shade900, size: 30),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  eyeopen == false
                                      ? eyeopen = true
                                      : eyeopen = false;
                                });
                              },
                              child: eyeopen == false
                                  ? Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: Colors.yellow.shade900,
                                      size: 30,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.yellow.shade900,
                                      size: 30,
                                    ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password can't be empty";
                            }
                            if (value.length < 6) {
                              return "Password size can't be less than 6";
                            }
                            if (value == value.toLowerCase() ||
                                value == value.toUpperCase()) {
                              return "Password must have atleast one LowerCase and one UpperCase";
                            }

                            if (value.contains('0') ||
                                value.contains('1') ||
                                value.contains('2') ||
                                value.contains('3') ||
                                value.contains('4') ||
                                value.contains('5') ||
                                value.contains('6') ||
                                value.contains('7') ||
                                value.contains('8') ||
                                value.contains('9')) {
                              isDigit = true;
                              //return isDigit;

                            }
                            if (isDigit == false) {
                              return "Password must contain atleast one Digit";
                            }

                            setState(() {
                              isDigit = false;
                            });

                            return null;
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      Material(
                        color: changeButton
                            ? Colors.teal.shade50
                            : Colors.lightBlue.shade300,
                        borderRadius: changeButton
                            ? BorderRadius.circular(25)
                            : BorderRadius.circular(5),
                        child: InkWell(
                          splashColor: changeColor == 1
                              ? Colors.blue.shade900
                              : Colors.red,
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 45 : 90,
                            height: changeButton ? 55 : 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? (Icon(
                                    Icons.check_circle,
                                    color: entry == false
                                        ? Colors.yellow.shade900
                                        : Colors.red.shade900,
                                    size: 40,
                                  ))
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20,
                                        //  color: Colors.yellow.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
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
    );
  }
}
