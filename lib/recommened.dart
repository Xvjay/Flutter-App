class Recommendation {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  Recommendation({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
  });

  static List<Recommendation> getrem() {
    List<Recommendation> diets = [];

    diets.add(Recommendation(
      name: 'apple',
      iconPath: 'assets/icons/apple.svg',
      level: 'Easy',
      duration: '30mins',
      calorie: '237cal',
      viewIsSelected: true,
    ));

    diets.add(Recommendation(
      name: 'avocado',
      iconPath: 'assets/icons/avocado.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '230cal',
      viewIsSelected: false,
    ));

    return diets;
  }
}
