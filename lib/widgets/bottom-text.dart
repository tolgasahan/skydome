import 'package:flutter/material.dart';

List<String> list = <String>['Günlük', 'Haftalık', 'Aylık', 'Yıllık'];

class BottomText extends StatefulWidget {
  String text;
  BottomText(this.text);

  @override
  State<BottomText> createState() => _BottomTextState(text);
}

class _BottomTextState extends State<BottomText> {
  String text;
  _BottomTextState(this.text);

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
            flex:4,
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(text),
          )),
          Expanded(
              flex:1,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 0,
                style: const TextStyle(color: Colors.black),
                underline: Container(color: Colors.transparent,),
                onChanged: (String? value) {

                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}
