import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_club_open_library/Article/bookmark_item.dart';
import 'package:reading_club_open_library/Article/entertainment.dart';
import 'package:reading_club_open_library/DetailedPages/Entertainment_detailed_page.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class Entertainment extends StatefulWidget {
  const Entertainment({Key? key}) : super(key: key);

  @override
  State<Entertainment> createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  bool isbookmarked = false;
  bool issorted = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.red.shade100,
              onChanged: (value) {
                SearchMutation(value);
              },
            ).pOnly(top: 8).h(50).wThreeForth(context),
            IconButton(
              color: Colors.black,
              iconSize: 35,
              onPressed: () {
                setState(() {
                  issorted = !issorted;
                });
              },
              icon: issorted
                  ? const Icon(CupertinoIcons.sort_up)
                  : const Icon(CupertinoIcons.sort_down),
            ).wOneForth(context),
          ],
        ),
        VxBuilder(
          mutations: const {SearchMutation, EAddMutation, ERemoveMutation},
          builder: (context, store, status) => ListView.builder(
            itemCount: (VxState.store as MyStore).earticle.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // final entItem = (VxState.store as MyStore).earticle[index];

              final sortedsciItem = issorted //4th
                  ? (VxState.store as MyStore)
                      .earticle
                      .sortedBy((a, b) => b.name.compareTo(a.name))
                  : (VxState.store as MyStore)
                      .earticle
                      .sortedBy((a, b) => a.name.compareTo(b.name));

              final entItem = sortedsciItem[index];

              return VxBox(
                      child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ListImage(image: entItem.image),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: "By: ${entItem.Author}"
                              .text
                              .bold
                              .textStyle(
                                  const TextStyle(fontStyle: FontStyle.italic))
                              .make()),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        entItem.name.text.bold.xl2.center.make(),
                        const SizedBox(
                          height: 4,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: "On: ${entItem.Date} at: ${entItem.time}"
                                .text
                                .textStyle(const TextStyle(fontSize: 10))
                                .make()),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: entItem.desc.text
                              .textStyle(const TextStyle(
                                  fontSize: 15, color: Colors.purple))
                              .make(),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isbookmarked = !isbookmarked;
                                  });
                                  isbookmarked
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              content:
                                                  "Bookmark Added".text.make()))
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              content: "Bookmark Removed"
                                                  .text
                                                  .make()));
                                },
                                icon: isbookmarked
                                    ? const Icon(Icons.bookmark_added_sharp)
                                    : const Icon(Icons.bookmark_add_sharp)),
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        content:
                                            "This Option Will Be Available Soon"
                                                .text
                                                .make()));
                              },
                              child: "Read >>".text.bold.black.make(),
                              style: TextButton.styleFrom(
                                  shape: const StadiumBorder(
                                      side: BorderSide(
                                          width: 3, color: Colors.black)),
                                  backgroundColor: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ))
                  .color(const Color(0xFFF5F5F5))
                  .square(270)
                  .rounded
                  .p12
                  .make()
                  .py12()
                  .px4()
                  .onTap(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EDetailedPage(item: entItem),
                    ));
              });
            },
          ).expand(),
        ),
      ],
    );
  }
}

class ListImage extends StatelessWidget {
  final String image;

  const ListImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Image(
        image: NetworkImage(image),
      ),
    ).height(180).color(const Color(0xFFF0EAD6)).rounded.p8.width(120).make();
  }
}
