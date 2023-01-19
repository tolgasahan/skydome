import 'dart:math';
import 'package:flutter/material.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skydome/widgets/profit.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedPage;
  late final PageController _bottomPageController;
  String _appBarText = "Fabirka Genel Verimliliği";

  @override
  void initState() {
    selectedPage = 0;
    _bottomPageController = PageController(initialPage: selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          _appBarText,
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Decorations.homePageColor,
        elevation: 0,
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            if (index == 0)
              _appBarText = "Fabrika Genel Verimliliği";
            else
              _appBarText = "Tekstil Genel Durum";
          });
        },
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.475,
                    width: double.infinity,
                    color: Decorations.homePageColor,
                    child: CircularPercentIndicator(
                      radius: 180,
                      lineWidth: 15,
                      percent: 0.5,
                      backgroundColor: Colors.grey,
                      backgroundWidth: 5,
                      center: Container(
                        alignment: Alignment.center,
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue[300]),
                        child: Text(
                          "%50",
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                      ),
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.130,
                width: double.infinity,
                color: Decorations.homePageColor,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 1,
                      child: Profit(Icons.check_circle, 53.72, "Kazanç"),
                    ),
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 1,
                      child: Profit(Icons.radar_rounded, 64.32, "Optimum"),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.270,
                child: PageView(
                  controller: _bottomPageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  children: [
                    Center(
                      child: Text('First Page'),
                    ),
                    Center(
                      child: Text('Second Page'),
                    ),
                    Center(
                      child: Text('Third Page'),
                    ),
                  ],
                ),
              ),
              PageViewDotIndicator(
                size: Size(MediaQuery.of(context).size.height * 0.008, MediaQuery.of(context).size.height * 0.008),
                currentItem: selectedPage,
                count: 3,
                unselectedColor: Colors.black26,
                selectedColor: Colors.black,
                duration: Duration(milliseconds: 200),
                boxShape: BoxShape.circle,
              ),
            ],
          ),
          Container(
            decoration: Background("images/bg.jpg").getBackground(),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, item) {
                  return Container(
                    height: 125,
                    margin: EdgeInsets.all(10),
                    child: Card(
                      color: Colors.grey,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("Makina " + (item + 1).toString())),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
