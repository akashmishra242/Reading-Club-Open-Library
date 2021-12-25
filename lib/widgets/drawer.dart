// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final imageUrl = "https://cdn-icons-png.flaticon.com/512/3011/3011270.png";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //color: context.cardColor,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    //color: context.canvasColor,
                    ),
                accountName: Text(
                  (VxState.store as MyStore).loginPage.UserName,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                accountEmail:
                    "${(VxState.store as MyStore).loginPage.UserName.toLowerCase().trim().replaceAll(' ', '')}@gmail.com"
                        .text
                        .black
                        .make(),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "My Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bookmark_fill,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Bookmark",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.globe,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Language",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.question_circle_fill,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Help & Support",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.power,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
