import 'package:flutter/material.dart';
import 'package:skydome/data/chart-data.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/screens/homepage/firstpage.dart';
import 'package:skydome/screens/homepage/secondpage.dart';

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

  late int selectedPage;
  late final PageController pageController;

  @override
  void initState() {
    selectedPage = 0;
    pageController = PageController(initialPage: selectedPage);
    super.initState();
  }

  var themeColor = Decorations.homePageColor;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedPage == 1) {
          pageController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
        } else if (selectedPage == 0) {
          showDialog(context: context,
              builder: (BuildContext cc) {
                return AlertDialog(
                    content: TextButton(onPressed: (){Navigator.of(cc, rootNavigator: true).pop();}, child: Text("sad"))
                );
              });
        }
        return false;
      },
      child: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        children: [
          FirstPage(chartData1, chartData2, pageController),
          SecondPage(chartData1,pageController)
        ],
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Çıkış yapmak istediğinize emin misiniz?'),
        action: SnackBarAction(label: 'Evet', onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}


