import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:prac1/cateogorys.dart';
import 'package:prac1/recommened.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Categorymod> categorys = [];
  List<Recommendation> rems = [];

  void _getCats() {
    categorys = Categorymod.getcats();
  }

  void _getRems() {
    rems = Recommendation.getrem();
  }

  void _getInitalInfo() {
    categorys = Categorymod.getcats();
    rems = Recommendation.getrem();
  }

  @override
  Widget build(BuildContext context) {
    _getRems();
    _getCats();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          seachBar(),
          SizedBox(
            height: 40,
          ),
          categorySec(),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Recommendations\nfor Diet',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 180,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 180,
                      decoration: BoxDecoration(
                          color: categorys[index].boxColor.withOpacity(.4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Svg(rems[index].iconPath),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                rems[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                rems[index].level +
                                    ' | ' +
                                    rems[index].duration +
                                    ' | ' +
                                    rems[index].calorie,
                                style: TextStyle(
                                    color: Color(0xff7B6F72),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 120,
                            child: Center(
                              child: Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  rems[index].viewIsSelected
                                      ? Color(0xff9DCEFF)
                                      : Colors.transparent,
                                  rems[index].viewIsSelected
                                      ? Color.fromARGB(255, 0, 122, 245)
                                      : Colors.transparent
                                ]),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
                  itemCount: rems.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column categorySec() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categorys.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 103,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: categorys[index].boxColor.withOpacity(.4)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Svg(categorys[index].iconPath),

                                //image: Svg('assets/icons/menu.svg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        categorys[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ]),
              );
            },
          ),
        )
      ],
    );
  }

  Container seachBar() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withOpacity(.30),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'click meeee',
            hintStyle: TextStyle(fontSize: 15),
            prefixIcon: Container(
              width: 0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg('assets/icons/search.svg'),
                ),
              ),
            ),
            suffixIcon: Container(
              width: 0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg('assets/icons/filter.svg'),
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "myApp",
        style: TextStyle(
            color: Colors.black, fontSize: 29, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: Svg(
                  'assets/icons/left.svg',
                ),
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 30,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg('assets/icons/menu.svg'),
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
