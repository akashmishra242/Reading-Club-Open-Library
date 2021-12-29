// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:reading_club_open_library/Article/business.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:reading_club_open_library/Article/science.dart';

class SDetailedPage extends StatelessWidget {
  final Article item;

  const SDetailedPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            item.name.text.bold.xl4.center.make(),
            Align(
              alignment: Alignment.topRight,
              child: "On: ${item.Date} at: ${item.time}  "
                  .text
                  .textStyle(const TextStyle(fontSize: 15))
                  .make(),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              height: 75,
              color: const Color(0xFFF0EAD6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.share_outlined, color: Colors.teal.shade900),
                  "By: ${item.Author}".text.bold.xl2.make(),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(item.auth_image),
                    //minRadius: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: VxArc(
                height: 50,
                arcType: VxArcType.CONVEX,
                edge: VxEdge.TOP,
                child: Container(
                  color: const Color(0xFFF0FFFF),
                  child: Column(children: [
                    item.article.text.center.xl2.make().py24().px12(),
                  ]).wFull(context).py64(),
                ),
              ),
            ))
          ],
        ).pOnly(top: 8),
      ),
    );
  }
}
