import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skydome/data/chart-data.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ChartData> chartData = <ChartData>[
    ChartData(1, 15),
    ChartData(2, 72),
    ChartData(3, 50),
    ChartData(4, 88),
    ChartData(5, 45),
    ChartData(6, 73),
    ChartData(7, 15),
    ChartData(8, 72),
    ChartData(9, 50),
    ChartData(10, 88),
    ChartData(11, 45),
    ChartData(12, 73),
    ChartData(13, 15),
    ChartData(14, 72),
    ChartData(15, 50),
    ChartData(16, 88),
    ChartData(17, 45),
    ChartData(18, 73),
  ];
  final List<ChartData> chartData2 = <ChartData>[
    ChartData(1, 28),
    ChartData(2, 20),
    ChartData(3, 15),
    ChartData(4, 58),
    ChartData(5, 44),
    ChartData(6, 20),
    ChartData(7, 28),
    ChartData(8, 20),
    ChartData(9, 15),
    ChartData(10, 58),
    ChartData(11, 44),
    ChartData(12, 20),
    ChartData(13, 28),
    ChartData(14, 20),
    ChartData(15, 15),
    ChartData(16, 58),
    ChartData(17, 44),
    ChartData(18, 20),
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

  var themeColor = Decorations.homePageColor;
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
        backgroundColor: themeColor,
        elevation: 0,
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            setAppBarText(index);
          });
        },
        children: [
          Column(
            children: [
              Expanded(
                flex: 27,
                child: Container(
                    alignment: Alignment.topCenter,
                    color: themeColor,
                    child: buildFactoryProductivity(40)),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: themeColor,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 100,
                        child: buildProfit(Icons.check_circle, 53.72, "Kazanç"),
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
                        child: buildProfit(Icons.radar_rounded, 64.32, "Optimum"),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                        "Makina ${(itemCount + 1).toString()}"),
                                  ))
                                ],
                              )),
                          Expanded(
                            flex: 10,
                            child: Container(
                                padding: EdgeInsets.only(right: 15,left: 10),
                                child: buildBottomChart(chartData, chartData2)),
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
                    child: buildMachineCard(item, chartData),
                  );
                }),
          )
        ],
      ),
    );
  }

  setAppBarText(int index){if (index == 0)
    _appBarText = "Fabrika Genel Verimliliği";
  else
    _appBarText = "Tekstil Genel Durum";
  }

  Widget buildFactoryProductivity(int percent) {
    return CircularPercentIndicator(
      radius: 180,
      lineWidth: 15,
      percent: percent/100,
      backgroundColor: Colors.grey,
      backgroundWidth: 5,
      center: Container(
        alignment: Alignment.center,
        width: 280,
        height: 280,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.blue[300]),
        child: Text(
          '%$percent',
          style: TextStyle(fontSize: 100, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildProfit(var icon, double profit, String text) {
    return Row(
      children: [
        Container(
          width: 85,
          child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 97,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profit.toString() + "₺",
                style: TextStyle(fontSize: 25),
              ),
              Text(text, style: TextStyle(fontSize: 15))
            ],
          ),
        )
      ],
    );
  }

  Widget buildBottomChart(List<ChartData> data1, List<ChartData> data2) {
    return SfCartesianChart(
      margin: EdgeInsets.zero,
      legend: Legend(
        itemPadding: 1,
        isVisible: true,
        offset: Offset(0, -60),
      ),
      plotAreaBorderWidth: 0,
      primaryYAxis: NumericAxis(
        maximum: 135,
        labelStyle: TextStyle(fontSize: 0),
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryXAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      series: <ChartSeries>[
        SplineAreaSeries<ChartData, int>(
            dataSource: data1,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y),
        SplineAreaSeries<ChartData, int>(
            dataSource: data2,
            opacity: 0.90,
            color: Colors.green,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ],
    );
  }

  Widget buildCardChart(List<ChartData> data) {
    return SfCartesianChart(
      margin: EdgeInsets.zero,
      plotAreaBorderWidth: 0,
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 100,
        labelStyle: TextStyle(fontSize: 0),
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryXAxis: NumericAxis(
        maximum: 15,
        labelStyle: TextStyle(fontSize: 0),
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      series: <ChartSeries>[
        StepLineSeries<ChartData, int>(
            color: Colors.grey,
            width: 3,
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y),
      ],
    );
  }

  Widget buildMachineCard(int index, List<ChartData> data) {
    Random random = new Random();
    return Card(
      elevation: 3,
      color: Colors.grey,
      child: Column(
        children: [
          Expanded(
              flex: 20,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text('Makina ${index + 1}'),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "%${random.nextInt(100)}",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.grey, Colors.white60, Colors.white],
                            stops: [0.0, 0.4, 0.7])),
                    child: buildCardChart(data),
                  ))
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ))
        ],
      ),
    );
  }


}
