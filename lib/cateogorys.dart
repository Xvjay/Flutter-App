import "package:flutter/material.dart";

class Categorymod {
  String name;
  String iconPath;
  Color boxColor;

  Categorymod({
    required this.name,
    required this.boxColor,
    required this.iconPath,
  });

  static List<Categorymod> getcats() {
    List<Categorymod> categorys = [];

    categorys.add(Categorymod(
        name: 'apple',
        boxColor: Color(0xff92A3FD),
        iconPath: 'assets/icons/apple.svg'));

    categorys.add(Categorymod(
        name: 'avocado',
        boxColor: Color(0xffC58BF2),
        iconPath: 'assets/icons/avocado.svg'));

    categorys.add(Categorymod(
        name: 'grape',
        boxColor: Color(0xff92A3FD),
        iconPath: 'assets/icons/grape.svg'));

    categorys.add(Categorymod(
        name: 'salad',
        boxColor: Color(0xffC58BF2),
        iconPath: 'assets/icons/strawberry.svg'));

    return categorys;
  }
}
