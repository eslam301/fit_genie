import 'package:flutter/cupertino.dart';

class HomeLayOutProvider extends ChangeNotifier  {
  int pageIndex = 0;
   changePageIndex(int index) {
    pageIndex = index;
    notifyListeners();

  }


}