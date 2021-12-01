import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Reading Club -Open Library".text.make(),
      ),
      body: Column(
        children: [
          "Home Page".text.make(),
        ],
      ),
    );
  }
}
