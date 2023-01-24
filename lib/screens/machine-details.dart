
import 'package:flutter/material.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/widgets/bottom-text.dart';
import 'package:skydome/widgets/circular_percent.dart';
import 'package:skydome/widgets/linear_percent.dart';
import 'package:skydome/widgets/profit.dart';

class MachineDetails extends StatefulWidget {
  int machineID;
  MachineDetails(this.machineID);


  @override
  State<MachineDetails> createState() => _MachineDetailsState(machineID);
}

class _MachineDetailsState extends State<MachineDetails> {
  int machineID;
  _MachineDetailsState(this.machineID);
  @override
  Widget build(BuildContext context) {
    String _appBarText = "Makina";
    var themeColor = Decorations.homePageColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _appBarText,
        ),
        backgroundColor: themeColor,
        elevation: 0,
      ),
      body:Column(
        children: [
          Expanded(
            flex: 27,
            child: Container(
                alignment: Alignment.topCenter,
                color: themeColor,
                child: Container(width: 350,height: 350,child: CircularPercent(50))),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: themeColor,
              child: Row(
                children: [
                  Profit(Icons.check_circle, "Kazanç",53.72),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      height: 35,
                    ),
                  ),
                  Profit(Icons.radar_rounded, "Optimum",64.32)
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
                Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 0.5)),margin: EdgeInsets.all(15),child: LinearPercent(20,20,60),))
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget buildFaults(String textLeft, String textRight,var color){
    return  Expanded(
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15,right: 5),
            child: Icon(Icons.square,color: color,)),
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
