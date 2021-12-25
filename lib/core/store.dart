import 'package:reading_club_open_library/Article/bookmark_item.dart';
import 'package:reading_club_open_library/Article/business.dart';
import 'package:reading_club_open_library/Article/entertainment.dart';
import 'package:reading_club_open_library/Article/science.dart';
import 'package:reading_club_open_library/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late SciArticle sciArticle;
  late BusArticle busArticle;
  late EntArticle entArticle;
  late BookmarkItem bookmarkItem;
  late LoginPage loginPage;
  //List<Item> items;
  late List<Article> article;
  late List<BArticle> barticle;

  late List<EArticle> earticle;

  MyStore() {
    sciArticle = SciArticle();
    busArticle = BusArticle();
    entArticle = EntArticle();
    bookmarkItem = BookmarkItem();
    loginPage = LoginPage();
    bookmarkItem.sciArticle = sciArticle;
    bookmarkItem.busArticle = busArticle;
    bookmarkItem.entArticle = entArticle;
  }
}
