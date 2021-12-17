import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    return Container(child: "e".text.make());
  }
}
