// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     const String imageUrl =
//         "https://cdn-icons-png.flaticon.com/512/295/295128.png";
//     return SafeArea(
//       child: Material(
//         child: Column(
//           children: [
//             Image(image: NetworkImage(imageUrl)).h40(context),
//             Column(
//               children: [],
//             ),
//           ],
//         ).pOnly(top: 10),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String imageUrl =
      "https://cdn-icons-png.flaticon.com/512/295/295128.png";
  bool changeButton = false;
  bool eyeopen = false;
  bool isDigit = false;
  num changeColor = 1;
  bool entry = false;
  // ignore: unused_field
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      for (var i = 0; i < 10; i++) {
        changeColor = changeColor * (-1);
        entry == false ? entry = true : entry = false;
        await Future.delayed(Duration(milliseconds: 100));
        setState(() {});
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
                          labelStyle: TextStyle(
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
                          if (value!.isEmpty) {
                            return "UserName can't be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          obscureText: eyeopen == false ? true : false,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Password",
                            labelStyle: TextStyle(
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
                      SizedBox(
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
                            duration: Duration(seconds: 1),
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
                                : Text(
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
