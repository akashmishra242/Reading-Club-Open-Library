import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_club_open_library/pages/home_page.dart';
import 'package:reading_club_open_library/pages/profile.dart';
import 'package:reading_club_open_library/widgets/customizedicon.dart';
import 'bookmark.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> navigate = [
    const BookmarkPage(),
    HomePage(),
    const ProfilePage()
  ];
  String homeicon =
      "https://cdn0.iconfinder.com/data/icons/aami-web-internet/64/simple-01-512.png";
  String profileicon =
      "https://cdn4.iconfinder.com/data/icons/eon-ecommerce-i-1/32/user_profile_man-128.png";
  String bookmarkicon =
      "https://cdn2.iconfinder.com/data/icons/lightly-icons/30/bookmark-240.png";
  int currentindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          currentIndex: currentindex,
          elevation: 5,
          selectedItemColor: Colors.red,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
                icon: CustIcon(
                  custicon: bookmarkicon,
                  index: 0,
                  currentindex: currentindex,
                ),
                label: "Bookmark"),
            BottomNavigationBarItem(
                icon: CustIcon(
                  custicon: homeicon,
                  index: 1,
                  currentindex: currentindex,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: CustIcon(
                  custicon: profileicon,
                  index: 2,
                  currentindex: currentindex,
                ),
                label: "Profile"),
          ]),
      body: navigate[currentindex],
    );
  }
}
