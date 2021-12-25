import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_club_open_library/Article/bookmark_item.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SRemoveMutation]);
    final BookmarkItem _bookmarkItem = (VxState.store as MyStore).bookmarkItem;

    return SafeArea(
      child: Column(
        children: [
          "BOOKMARKED ITEMS".text.bold.xl3.red900.make(),
          ListView.builder(
            itemCount:
                // 10,
                _bookmarkItem.sitems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(_bookmarkItem.sitems[index].image),
                title:
                    // "Bookmark".text.black.make(),
                    _bookmarkItem.sitems[index].name.text.make(),
                trailing: IconButton(
                  onPressed: () {
                    // _cart.remove(_cart.items[index]);
                    SRemoveMutation(_bookmarkItem.sitems[index]);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 1000),
                        content: "Removed Successfully".text.make()));
                    //setState(() {});
                  },
                  icon: const Icon(CupertinoIcons.minus_circled),
                ),
              ).p12();
            },
          ).expand()
        ],
      ),
    );
  }
}
