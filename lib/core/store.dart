import 'package:reading_club_open_library/Article/bookmark_item.dart';
import 'package:reading_club_open_library/Article/business.dart';
import 'package:reading_club_open_library/Article/entertainment.dart';
import 'package:reading_club_open_library/Article/science.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late SciArticle sciArticle;
  late BusArticle busArticle;
  late EntArticle entArticle;
  late BookmarkItem bookmarkItem;

  MyStore() {
    sciArticle = SciArticle();
    busArticle = BusArticle();
    entArticle = EntArticle();
    bookmarkItem = BookmarkItem();
    bookmarkItem.sciArticle = sciArticle;
    bookmarkItem.busArticle = busArticle;
    bookmarkItem.entArticle = entArticle;
  }
}
