/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/home_menu_item.dart';
import '../model/introitem.dart';

const String logo = "assets/login/logo.png";

final List<IntroItem> introItems = [
  IntroItem(
      image: logo,
      title: "Load Fund",
      subtitle: "Load funds in your khalti from your Bank account"),
  IntroItem(
      image: logo,
      title: "Pay on the go",
      subtitle: "Recharge, make gene service payment bills and much more"),
  IntroItem(
      image: logo,
      title: "Fund transfer",
      subtitle: "Request send money to your friends."),
];
