

import 'package:flutter_list_floor/models/phases.dart';

class Main2x2 implements Phase {
  @override
  int count = main2x2_title.length;

  @override
  String phase = "MAIN2X2";

  @override
  List<String> titles() => main2x2_title;

  @override
  List<String> icons() => main2x2_icon;

  @override
  List<String> descriptions() => main2x2_descr;

  @override
  List<String> urls() => main2x2_url;

  @override
  List<String> comments() => List.filled(count, "");

  ///==================================================

  static const main2x2_title = [
    "Метод для начинающих",
    "Фридрих для 2х2",
    "Метод Ортега",
    "CLL для двушки",
    main2x2_st5_title,
  ];

  static const main2x2_icon = [
    "v2x2_begin_1",
    "v2x2_adv_1",
    "ortega_1",
    "cll",
    "main2x2",
  ];

  static const main2x2_descr = [
    main2x2_st1_descr,
    main2x2_st2_descr,
    main2x2_st3_descr,
    main2x2_st4_descr,
    main2x2_st5_descr,
  ];

  static const main2x2_url = [
    "submenu",
    "submenu",
    "submenu",
    "submenu",
    main2x2_st5_url
  ];

  static const main2x2_st1_descr = "BEGIN2X2";
  static const main2x2_st2_descr = "ADV2X2";
  static const main2x2_st3_descr = "ORTEGA";
  static const main2x2_st4_descr = "CLL";

  static const main2x2_st5_title = "Слепая сборка (Blind)";
  static const main2x2_st5_descr = "<p>Учимся собирать 2х2 вслепую.</p>";
  static const main2x2_st5_url = "nLuMory7dSs";
}
