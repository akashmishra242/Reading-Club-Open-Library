// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'business.dart';
import 'entertainment.dart';
import 'science_tech.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Reading Club -Open Library".text.make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_sharp),
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            "Entertainment".text.make(),
            "Science&Tech".text.make(),
            "Business".text.make(),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Entertainment(),
          ScienceTech(),
          Business(),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
