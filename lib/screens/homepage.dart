import 'dart:math';
import 'package:flutter/material.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:curved_gradient/curved_gradient.dart';
import 'package:skydome/widgets/profit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  String _appBarText = "Fabirka Genel Verimliliği";
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
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            if(index == 0)_appBarText = "Fabrika Genel Verimliliği";
            else _appBarText = "Tekstil Genel Durum";
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
                      linearGradient: CurvedGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.topLeft,
                        colors: [Colors.red, Colors.green],
                        granularity: 100,
                        curveGenerator: (x) => pow(1 - x, 8).toDouble(),
                      ),
                      radius: 180,
                      lineWidth: 30,
                      percent: 1,
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
                height: MediaQuery.of(context).size.height * 0.290,
                child: PageView(
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
            ],
          ),
          Container(
            decoration: Background("images/bg.jpg").getBackground(),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,item) {
                  return Container(
                    height: 125,
                    margin: EdgeInsets.all(10),
                    child: Card(
                      color: Colors.grey,
                      child: Container(padding: EdgeInsets.all(5),child: Text("Makina " +(item+1).toString())),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
