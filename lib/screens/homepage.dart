import 'dart:math';
import 'package:flutter/material.dart';
import 'package:skydome/data/chart-data.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skydome/widgets/profit.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ChartData> chartData = <ChartData>[
    ChartData(1, 21),
    ChartData(2, 24),
    ChartData(3, 35),
    ChartData(4, 38),
    ChartData(5, 54),
    ChartData(6, 21),
  ];
  final List<ChartData> chartData2 = <ChartData>[
    ChartData(1, 28),
    ChartData(2, 20),
    ChartData(3, 15),
    ChartData(4, 58),
    ChartData(5, 44),
    ChartData(6, 20),
  ];
  late int pageCount = 3;
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
      resizeToAvoidBottomInset: false,
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
              Expanded(
                flex: 27,
                child: Container(
                    alignment: Alignment.topCenter,
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
              Expanded(
                flex: 8,
                child: Container(
                  color: Decorations.homePageColor,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 100,
                        child: Profit(Icons.check_circle, 53.72, "Kazanç"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          height: 35,
                        ),
                      ),
                      Expanded(
                        flex: 100,
                        child: Profit(Icons.radar_rounded, 64.32, "Optimum"),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  child: PageView.builder(
                    itemCount: pageCount,
                    controller: _bottomPageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedPage = index;
                      });
                    },
                    itemBuilder: (context, itemCount) {
                      return Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                        "Makina ${(itemCount + 1).toString()}"),
                                  )),
                                  Expanded(
                                      child: Container(
                                    alignment: Alignment.centerRight,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                        "Makina ${(itemCount + 1).toString()}"),
                                  ))
                                ],
                              )),
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding: EdgeInsets.only(right: 5),
                              child: SfCartesianChart(
                                legend: Legend(
                                    itemPadding: 1,
                                    isVisible: true,
                                    offset: Offset(0, -60),
                                ),
                                plotAreaBorderWidth: 0,
                                primaryYAxis: NumericAxis(
                                  labelStyle: TextStyle(fontSize: 0),
                                  axisLine: const AxisLine(width: 0),
                                  majorTickLines:
                                      const MajorTickLines(width: 0),
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                ),
                                primaryXAxis: NumericAxis(
                                  axisLine: const AxisLine(width: 0),
                                  majorTickLines:
                                      const MajorTickLines(width: 0),
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                ),
                                series: <ChartSeries>[
                                  SplineAreaSeries<ChartData, int>(
                                      dataSource: chartData,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y),
                                  SplineAreaSeries<ChartData, int>(
                                      dataSource: chartData2,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y)
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: PageViewDotIndicator(
                  unselectedSize: Size(8, 8),
                  size: Size(8, 8),
                  currentItem: selectedPage,
                  count: pageCount,
                  unselectedColor: Colors.black26,
                  selectedColor: Colors.black,
                  duration: Duration(milliseconds: 200),
                  boxShape: BoxShape.circle,
                ),
              )
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
                    // Cardları böl
                  );
                }),
          )
        ],
      ),
    );
  }
}
