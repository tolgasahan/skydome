import 'package:flutter/material.dart';
import 'package:skydome/decorations/box/box-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/widgets/bottom-text.dart';
import 'package:skydome/widgets/circular_percent.dart';
import 'package:skydome/widgets/linear_percent.dart';
import 'package:skydome/widgets/profit.dart';

class MachineDetails extends StatefulWidget {
  int machineID;
  bool isWorking;
  MachineDetails(this.machineID,this.isWorking);

  @override
  State<MachineDetails> createState() => _MachineDetailsState(machineID,isWorking);
}

class _MachineDetailsState extends State<MachineDetails> {
  int machineID;
  bool isWorking;
  _MachineDetailsState(this.machineID,this.isWorking);

  late int topBarFlex;
  late int circleProgressFlex;

  String _appBarText = "Makina";
  var themeColor ;

  @override
  void initState() {
    if(isWorking == true){
      topBarFlex = 0;
      circleProgressFlex=27;
      themeColor = Decorations.homePageColor;
    }
    else{
      topBarFlex= 4;
      circleProgressFlex= 23;
      themeColor = Colors.redAccent.shade700;
    }
    print(isWorking.toString());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _appBarText,
        ),
        backgroundColor: themeColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          if(isWorking == false)Expanded(flex:topBarFlex,child: Container(
            decoration: BoxDecorator(themeColor).eraseBorders(),
            child: Text("ÇALIŞMIYOR!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
            width: double.infinity,
            alignment: Alignment.center,) )
          ,
          Expanded(
            flex: circleProgressFlex,
            child:LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return  Container(
                      decoration: BoxDecorator(themeColor).eraseBorders(),
                        alignment: Alignment.topCenter,

                       child: CircularPercent(100,constraints.maxHeight),
                    );
                  },
                ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecorator(themeColor).eraseBorders(),
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
          BottomText("text"),
          Expanded(
            flex: 15,
            child: Column(
              children: [
                buildFaults("textLeft", "textRight", Colors.purple),
                buildFaults("textLeft", "textRight", Colors.red),
                buildFaults("textLeft", "textRight", Colors.yellow),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  margin: EdgeInsets.all(15),
                  child: LinearPercent(20, 20, 60),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFaults(String textLeft, String textRight, var color) {
    return Expanded(
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15, right: 5),
              child: Icon(
                Icons.square,
                color: color,
              )),
          Text(textLeft),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15),
            child: Text(textRight),
          ))
        ],
      ),
    );
  }
}
