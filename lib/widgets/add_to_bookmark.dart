import 'package:flutter/material.dart';
import 'package:reading_club_open_library/Article/bookmark_item.dart';
import 'package:reading_club_open_library/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:reading_club_open_library/Article/science.dart';

class AddToBookmark extends StatefulWidget {
  final Article article;

  const AddToBookmark({Key? key, required this.article}) : super(key: key);

  @override
  State<AddToBookmark> createState() => _AddToBookmarkState();
}

class _AddToBookmarkState extends State<AddToBookmark> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SAddMutation, SRemoveMutation]);
    final BookmarkItem _bookmarkItem = (VxState.store as MyStore).bookmarkItem;
    bool isInbookmark = _bookmarkItem.sitems.contains(widget.article);
    return IconButton(
        onPressed: () {
          if (!isInbookmark) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(milliseconds: 1000),
                content: "Bookmark Added".text.make()));
            // : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //     duration: const Duration(milliseconds: 1000),
            //     content: "Bookmark Removed".text.make()));

            SAddMutation(widget.article);
          }
        },
        icon: isInbookmark
            ? const Icon(Icons.bookmark_added_sharp)
            : const Icon(Icons.bookmark_add_sharp));
  }
}
