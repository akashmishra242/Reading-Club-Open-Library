import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_club_open_library/Article/bookmark_item.dart';
import 'package:reading_club_open_library/Article/business.dart';
import 'package:reading_club_open_library/DetailedPages/Business_detailed_page.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  bool isbookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSearchTextField(
          backgroundColor: Colors.red.shade100,
          onChanged: (value) {
            SearchMutation(value);
          },
        ).pOnly(top: 8).h(50),
        VxBuilder(
          mutations: const {SearchMutation, BAddMutation, BRemoveMutation},
          builder: (context, store, status) => ListView.builder(
            itemCount: (VxState.store as MyStore).barticle.length,
            itemBuilder: (context, index) {
              final busItem = (VxState.store as MyStore).barticle[index];
              return VxBox(
                      child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ListImage(image: busItem.image),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: "By: ${busItem.Author}"
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
                        busItem.name.text.bold.xl2.center.make(),
                        const SizedBox(
                          height: 4,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: "On: ${busItem.Date} at: ${busItem.time}"
                                .text
                                .textStyle(const TextStyle(fontSize: 10))
                                .make()),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: busItem.desc.text
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
                      builder: (context) => BDetailedPage(item: busItem),
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
