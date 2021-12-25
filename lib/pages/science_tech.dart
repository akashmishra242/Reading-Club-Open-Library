import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_club_open_library/Article/bookmark_item.dart';
import 'package:reading_club_open_library/Article/science.dart';
import 'package:reading_club_open_library/DetailedPages/Science_detailed_page.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:reading_club_open_library/widgets/add_to_bookmark.dart';
import 'package:velocity_x/velocity_x.dart';

class ScienceTech extends StatefulWidget {
  const ScienceTech({Key? key}) : super(key: key);

  @override
  State<ScienceTech> createState() => _ScienceTechState();
}

class _ScienceTechState extends State<ScienceTech> {
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
          mutations: const {SearchMutation, SAddMutation, SRemoveMutation},
          builder: (context, store, status) => ListView.builder(
            itemCount: (VxState.store as MyStore).article.length,
            itemBuilder: (context, index) {
              final sciItem = (VxState.store as MyStore).article[index];
              return VxBox(
                      child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ListImage(image: sciItem.image),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: "By: ${sciItem.Author}"
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
                        sciItem.name.text.bold.xl2.center.make(),
                        const SizedBox(
                          height: 4,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: "On: ${sciItem.Date} at: ${sciItem.time}"
                                .text
                                .textStyle(const TextStyle(fontSize: 10))
                                .make()),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: sciItem.desc.text
                              .textStyle(const TextStyle(
                                  fontSize: 15, color: Colors.purple))
                              .make(),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            AddToBookmark(
                              article: sciItem,
                            ),
                            ElevatedButton(
                              onPressed: null,
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
                  .square(275)
                  .rounded
                  .p12
                  .make()
                  .py12()
                  .px4()
                  .onTap(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SDetailedPage(item: sciItem),
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
