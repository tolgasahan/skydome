import 'package:flutter/material.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/widgets/appbar-icon-button.dart';
import 'package:skydome/widgets/circular_percent.dart';
import 'package:skydome/data/chart-data.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:skydome/widgets/bottom-text.dart';
import 'package:skydome/widgets/profit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class FirstPage extends StatefulWidget {
  List<ChartData> chartData1;
  List<ChartData> chartData2;
  PageController pageController;
  FirstPage(this.chartData1,this.chartData2,this.pageController);

  @override
  State<FirstPage> createState() => _FirstPageState(chartData1,chartData2,pageController);
}

class _FirstPageState extends State<FirstPage> {
  PageController pageController;
  List<ChartData> chartData1;
  List<ChartData> chartData2;
  _FirstPageState(this.chartData1,this.chartData2,this.pageController);


  late int pageCount = 3;
  late int _selectedBottomPage;
  late final PageController _bottomPageController;
  var themeColor = Decorations.homePageColor;

  @override
  void initState() {
    _selectedBottomPage = 0;
    _bottomPageController = PageController(initialPage: _selectedBottomPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
        actions: [AppBarIconButton(1,Icons.arrow_forward_ios,pageController)],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Fabrika Genel Verimliliği"),
    backgroundColor: themeColor,
    elevation: 0,
    ),
    body: Column(
      children: [
        Expanded(
          flex: 27,
          child: Container(
              alignment: Alignment.topCenter,
              color: themeColor,
              child: Container(
                  width: 350,
                  height: 350,
                  child: CircularPercent(90))),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: themeColor,
            child: Row(
              children: [
                Profit(Icons.check_circle, "Kazanç", 53.72),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    height: 35,
                  ),
                ),
                Profit(Icons.radar_rounded, "Optimum", 64.32)
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
                  _selectedBottomPage = index;
                });
              },
              itemBuilder: (context, itemCount) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomText('Makina ${itemCount + 1}'),
                    Expanded(
                      flex: 10,
                      child: Container(
                          padding: EdgeInsets.only(right: 15, left: 10),
                          child:
                          buildBottomChart(chartData1, chartData2)),
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
            currentItem: _selectedBottomPage,
            count: pageCount,
            unselectedColor: Colors.black26,
            selectedColor: Colors.black,
            duration: Duration(milliseconds: 200),
            boxShape: BoxShape.circle,
          ),
        )
      ],
    ));
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
}
