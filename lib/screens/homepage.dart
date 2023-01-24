import 'dart:math';
import 'package:flutter/material.dart';
import 'package:skydome/data/chart-data.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/screens/homepage/firstpage.dart';
import 'package:skydome/screens/homepage/secondpage.dart';
import 'package:skydome/screens/machine-details.dart';
import 'package:skydome/widgets/linear_percent.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ChartData> chartData1 = <ChartData>[
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

  late int _selectedPage;
  late final PageController _pageController;
  String _appBarText = "Fabirka Genel Verimliliği";

  @override
  void initState() {
    _selectedPage = 0;
    _pageController = PageController(initialPage: _selectedPage);
    super.initState();
  }

  var themeColor = Decorations.homePageColor;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedPage == 1) {
          _pageController.animateTo(0,
              duration: Duration(milliseconds: 500), curve: Curves.decelerate);
        } else if (_selectedPage == 0) {
          _showToast(context);
        }

        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(_appBarText,),
          backgroundColor: themeColor,
          elevation: 0,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              setAppBarText(index);
              _selectedPage = index;
            });
          },
          children: [
            FirstPage(chartData1, chartData2),
            SecondPage(chartData1)
          ],
        ),
      ),
    );
  }

  setAppBarText(int index) {
    if (index == 0)
      _appBarText = "Fabrika Genel Verimliliği";
    else
      _appBarText = "Tekstil Genel Durum";
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(label: 'UNDO', onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
