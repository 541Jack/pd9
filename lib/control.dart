import 'package:flutter/cupertino.dart';
import './testing.dart';

class FileController extends ChangeNotifier {
  String _text = '';

  String get text => _text;

  readText() async {
    _text = await FileManager().readTextFile();
    notifyListeners();
  }

//  writeText() async {
//    _text = await FileManager().writeTextFile();
//    notifyListeners();
//  }
}
