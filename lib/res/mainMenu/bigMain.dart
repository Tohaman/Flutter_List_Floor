


import 'package:flutter_list_floor/models/phases.dart';

class BigMain implements Phase {
  @override
  int count = big_main_title.length;

  @override
  String phase = "BIGMAIN";

  @override
  List<String> titles() => big_main_title;

  @override
  List<String> icons() => big_main_icon;

  @override
  List<String> descriptions() => big_main_descr;

  @override
  List<String> urls() => big_main_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const big_main_title = [
        "Кубик 4х4 для начинающих",
        "Продвинутый 4х4 (метод Яу)",
        "Кубик 5х5 для начинающих",
        "Как собрать любой большой куб",
        "Сборка 4х4 вслепую",
    ];

    static const big_main_icon = [
        "big_main_1",
        "big_main_2",
        "big_main_3",
        "big_main_4",
        "big_main_5",
    ];
    
    static const big_main_descr = [
        big_main_st1_descr,
        big_main_st2_descr,
        big_main_st3_descr,
        big_main_st4_descr,
        big_main_st5_descr,
    ];

    static const big_main_url = [
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
    ];

    static const big_main_st1_descr = "BEGIN4X4";
    static const big_main_st2_descr = "YAU4X4";
    static const big_main_st3_descr = "BEGIN5X5";
    static const big_main_st4_descr = "BIG_CUBES";
    static const big_main_st5_descr = "BLIND4X4";


}
