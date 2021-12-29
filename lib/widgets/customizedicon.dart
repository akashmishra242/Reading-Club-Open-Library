import 'package:flutter/material.dart';

class CustIcon extends StatelessWidget {
  final String custicon;
  final int index;
  final int currentindex;

  const CustIcon({
    Key? key,
    required this.custicon,
    required this.index,
    required this.currentindex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(custicon),
      height: 25,
      color: index == currentindex ? Colors.red : Colors.black,
    );
  }
}
