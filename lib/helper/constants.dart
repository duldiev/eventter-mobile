// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter_mobile/data/models/profile.dart';

class Constants {
  static const double bigRadius1 = 16;
  static const double bigRadius2 = 14;
  static const double bigRadius3 = 12;
  static const double bigRadius4 = 10;
  static const double bigRadius5 = 8;
  static const double bigRadius6 = 6;

  static const double radius1 = 12;
  static const double radius2 = 10;
  static const double radius3 = 8;
  static const double radius4 = 6;
  static const double radius5 = 4;

  static String imageIcon(String name) {
    return "icons8-$name-100.png";
  }

  static Profile currentProfile =
      Profile(id: 1, firstName: "Raiymbek", lastName: "Duldiyev");
}
