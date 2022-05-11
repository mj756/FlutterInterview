import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tech_round/controller/NetworkController.dart';
import 'package:flutter_tech_round/models/model_category.dart';

import '../models/sticky_menu.dart';

class DashBoardController with ChangeNotifier
{
  int _currentPageIndex=0;
  int get currentPageIndex=>_currentPageIndex;
  final PageController pageController = PageController();
  late StickyMenu _top;
  StickyMenu get top=>_top;
  late ModelCategory? _modelCategories;
  ModelCategory? get modelCategories=>_modelCategories!;
  void changePageIndex(int index)
  {
    _currentPageIndex=index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  Future<void> getApiData()
  async {
    try
        {
          final String? modelTop=await NetworkController.get('https://fabcurate.easternts.in/top.json','');
         // final String? modelMiddle=await NetworkController.get('https://fabcurate.easternts.in/middle.json','');
        //  final String? modelBottom=await NetworkController.get('https://fabcurate.easternts.in/bottom.json','');
          if(modelTop!=null) {
            _top=StickyMenu.fromJson(json.decode(modelTop));

          }
          notifyListeners();
        }catch(e)
    {
      print(e);
    }
  }
  Future<void> getCategoryApiData()
  async {
    try
    {
      final String? modelTop=await NetworkController.get('https://fabcurate.easternts.in/category.json','');
      if(modelTop!=null) {
        _modelCategories=ModelCategory.fromJson(json.decode(modelTop));
      }
      notifyListeners();
    }catch(e)
    {
      print(e);
    }
  }

}