// ignore_for_file: unnecessary_getters_setters

import 'package:velocity_x/velocity_x.dart';

import 'package:reading_club_open_library/Article/business.dart';
import 'package:reading_club_open_library/Article/entertainment.dart';
import 'package:reading_club_open_library/Article/science.dart';
import 'package:reading_club_open_library/core/store.dart';

class BookmarkItem {
  late SciArticle _sciArticle;
  late BusArticle _busArticle;
  late EntArticle _entArticle;
  SciArticle get sciArticle => _sciArticle; //getter for science
  set sciArticle(SciArticle newSciArticle) //setter
  {
    _sciArticle = newSciArticle;
  }

  BusArticle get busArticle => _busArticle; //getter for business
  set busArticle(BusArticle newBusArticle) //setter
  {
    _busArticle = newBusArticle;
  }

  EntArticle get entArticle => _entArticle; //getter for entertainment
  set entArticle(EntArticle newEntArticle) //setter
  {
    _entArticle = newEntArticle;
  }

//collection of ids-> store id's of each items.
  final List<int> _itemids = [];

//get item in the bookmark
  List get bitems {
    return _itemids.map((id) => _sciArticle.getById(id)).toList();
  }

  List<EArticle> get eitems {
    return _itemids.map((id) => _entArticle.getById(id)).toList();
  }

  List<Article> get sitems {
    return _itemids.map((id) => _sciArticle.getById(id)).toList();
  }
  //List item => sitems+eitems+bitems;

//adding cart value after addition of new items.
  num get totalBookMarked => sitems.length + eitems.length + bitems.length;
}

class SAddMutation extends VxMutation<MyStore> {
  final Article sitems;

  SAddMutation(
    this.sitems,
  );
  @override
  perform() {
    store!.bookmarkItem._itemids.add(sitems.id.toInt());
  }
}

class BAddMutation extends VxMutation<MyStore> {
  final Article bitems;

  BAddMutation(
    this.bitems,
  );
  @override
  perform() {
    store!.bookmarkItem._itemids.add(bitems.id.toInt());
  }
}

class EAddMutation extends VxMutation<MyStore> {
  final EArticle eitems;
  EAddMutation(
    this.eitems,
  );
  @override
  perform() {
    store!.bookmarkItem._itemids.add(eitems.id.toInt());
  }
}

class SRemoveMutation extends VxMutation<MyStore> {
  final Article sitems;

  SRemoveMutation(
    this.sitems,
  );
  @override
  perform() {
    store!.bookmarkItem._itemids.remove(sitems.id.toInt());
  }
}

class BRemoveMutation extends VxMutation<MyStore> {
  final Article bitems;

  BRemoveMutation(
    this.bitems,
  );
  @override
  perform() {
    store!.bookmarkItem._itemids.remove(bitems.id.toInt());
  }
}

class ERemoveMutation extends VxMutation<MyStore> {
  final EArticle eitems;
  ERemoveMutation(
    this.eitems,
  );
  @override
  perform() {
    store!.bookmarkItem._itemids.remove(eitems.id.toInt());
  }
}
