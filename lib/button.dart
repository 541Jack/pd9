import 'package:flutter/material.dart';
import 'InputBox.dart';

class AddButton extends StatelessWidget {
  TextEditingController _durationBut = TextEditingController();
  TextEditingController _priorityBut = TextEditingController();
  var durationListBut = <int>[];
  var _priorityListBut = <double>[];

  AddButton(
    _durationBut,
    durationListBut,
    _priorityctrl,
    _priorityListBut,
  );

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: () {
      print('test');
      print(_durationBut.text);
      durationListBut.add(int.parse(_durationBut.text));
      _priorityListBut.add(double.parse(_priorityBut.text));
      print(durationListBut);
    });
  }
}
