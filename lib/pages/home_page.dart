// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reading_club_open_library/Article/business.dart';
import 'package:reading_club_open_library/Article/entertainment.dart';
import 'package:reading_club_open_library/Article/science.dart';
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
    loadSciData();
    loadBusData();
    loadEntData();
  }

  loadSciData() async {
    final sciJson =
        await rootBundle.loadString("lib/assets/files/sci_article.json");
    var sciDecodedData = jsonDecode(sciJson);
    var sciArticleData = sciDecodedData["sci_article"];
    SciArticle.article = List.from(sciArticleData)
        .map<Article>((article) => Article.fromMap(article))
        .toList();
    setState(() {});
  }

  loadBusData() async {
    final busJson =
        await rootBundle.loadString("lib/assets/files/bus_article.json");
    var busDecodedData = jsonDecode(busJson);
    var busArticleData = busDecodedData["bus_article"];
    BusArticle.article = List.from(busArticleData)
        .map<BArticle>((article) => BArticle.fromMap(article))
        .toList();
    setState(() {});
  }

  loadEntData() async {
    final entJson =
        await rootBundle.loadString("lib/assets/files/ent_article.json");
    var entDecodedData = jsonDecode(entJson);
    var entArticleData = entDecodedData["ent_article"];
    EntArticle.article = List.from(entArticleData)
        .map<EArticle>((article) => EArticle.fromMap(article))
        .toList();
    setState(() {});
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
