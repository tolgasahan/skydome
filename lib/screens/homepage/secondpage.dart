import 'package:flutter/material.dart';
import 'dart:math';
import 'package:skydome/data/chart-data.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/screens/machine-details.dart';
import 'package:skydome/widgets/appbar-icon-button.dart';
import 'package:skydome/widgets/linear_percent.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SecondPage extends StatefulWidget {
  List<ChartData> chartData;
  PageController pageController;
  SecondPage(this.chartData, this.pageController);

  @override
  State<SecondPage> createState() =>
      _SecondPageState(chartData, pageController);
}

class _SecondPageState extends State<SecondPage> {
  List<ChartData> chartData;
  PageController pageController;
  _SecondPageState(this.chartData, this.pageController);

  bool iW = false;
  @override
  Widget build(BuildContext context) {
    var themeColor = Decorations.homePageColor;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: AppBarIconButton(0, Icons.arrow_back_ios, pageController),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Makinalar",
          ),
          backgroundColor: themeColor,
          elevation: 0,
          actions: [IconButton(onPressed: (){setState(() {
            iW == true ? iW = false: iW = true;
          });}, icon: Icon(Icons.abc))],
        ),
        body: Container(
          decoration: Background("images/background.jpg").getBackground(),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, item) {
                return Container(
                  height: 125,
                  margin: EdgeInsets.all(10),
                  child: buildMachineCard(item, chartData),
                );
              }),
        ));
  }

  Widget buildCardChart(List<ChartData> data) {
     return Stack(
       children: [
         SfCartesianChart(
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
                color: Colors.white,
                width: 3,
                dataSource: data,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
          ],
    ),
         GestureDetector(
           onTap: () {
             setState(() {});
             return pushNavigator(1, iW);
           },
         )
       ],
     );
  }

  Widget buildMachineCard(int index, List<ChartData> data) {
    Random random = Random();
    return GestureDetector(
      onTap: () {
        setState(() {});
        return pushNavigator(1, iW);
      },
      child: Card(
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
                      child: buildCardChart(data),
                    ))
                  ],
                )),
            Expanded(flex: 1, child: LinearPercent(10, 50, 30))
          ],
        ),
      ),
    );
  }

  pushNavigator(int machineID,bool isWorking) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => MachineDetails(machineID,isWorking)));
  }


}
