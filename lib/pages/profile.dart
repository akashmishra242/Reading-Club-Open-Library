// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black12,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                    "https://cdn-icons-png.flaticon.com/512/3011/3011270.png")
                .h32(context),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (VxState.store as MyStore).loginPage.UserName.text.xl3.make(),
                  "${(VxState.store as MyStore).loginPage.UserName.toLowerCase().trim().replaceAll(' ', '')}@gmail.com"
                      .text
                      .xl2
                      .make(),
                ],
              ),
            ).wFull(context).h15(context),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bookmark),
                "  Total Numbers Of Bookmarked Item : ${(VxState.store as MyStore).bookmarkItem.sitems.length}"
                    .text
                    .bold
                    .xl
                    .make(),
              ],
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "APP VERSION 0.0.1",
                  style: Theme.of(context).textTheme.overline,
                ),
                Text(
                  "©Akash || ©siddharth || ©yashasvi || ©pranadeep",
                  style: Theme.of(context).textTheme.overline,
                ),
              ],
            ).expand(),
          ],
        ).pOnly(bottom: 20),
      ),
    );
  }
}
