// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:pos/views/pages/home/home_page.dart';
import 'package:pos/views/pages/vocabulary/test.dart';
import 'package:pos/views/pages/vocabulary/vocabulary_category_page.dart';
import 'package:pos/views/pages/vocabulary/vocabulary_detail_page.dart';
import 'package:pos/views/pages/vocabulary/vocabulary_page.dart';
import 'package:page_transition/page_transition.dart';

const Map routes = {
  "/": {
    "route_path": HomePage(),
    "transition": PageTransitionType.leftToRight,
    "duration": 800,
    "alignment": Alignment.bottomCenter,
    "childCurrent": HomePage(),
  },
  "/vocabulary": {
    "route_path": VocabularyPage(),
    "transition": PageTransitionType.scale,
    "duration": 800,
    "alignment": Alignment.center,
    "childCurrent": VocabularyPage(),
  },
  "/vocabulary/category": {
    "route_path": VocabularyCategoryPage(),
    "transition": PageTransitionType.leftToRight,
    "duration": 800,
    "alignment": Alignment.center,
    "childCurrent": VocabularyCategoryPage(),
  },
  "/vocabulary/detail": {
    "route_path": VocabularyDetailPage(),
    "transition": PageTransitionType.leftToRight,
    "duration": 800,
    "alignment": Alignment.center,
    "childCurrent": VocabularyDetailPage(),
  },
  "/test": {
    "route_path": testWidget(),
    "transition": PageTransitionType.leftToRight,
    "duration": 800,
    "alignment": Alignment.center,
    "childCurrent": testWidget(),
  },
};
