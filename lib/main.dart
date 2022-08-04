import 'package:flutter/material.dart';
import 'package:pd9/InputBox.dart';
import 'package:pd9/control.dart';
import 'package:provider/provider.dart';
import './button.dart';
import './testing.dart';
import './control.dart';

void main() => runApp(
      MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => FileController())],
          child: MyApp()),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var durationList = <int>[];
  var priorityList = <double>[];
  String outputString = '';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextEditingController _durationctrl = TextEditingController();
    final TextEditingController _priorityctrl = TextEditingController();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('This is a demo'),
          ),
          body: Column(
            children: [
              TextField(
                controller: _durationctrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Please Enter the Duration of Event',
                  labelText: 'Event Duration',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _priorityctrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter the Priority of Event',
                    labelText: 'Event Priorty'),
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                onPressed: () {
                  durationList.add(int.parse(_durationctrl.text));
                  priorityList.add(double.parse(_priorityctrl.text));
                  setState(() {});
                  print(_durationctrl.text);
                  print(_priorityctrl.text);
                  print(durationList);
                  print(priorityList);
                },
                child: Text('Add Event'),
              ),
              RaisedButton(
                onPressed: () {
                  for (int i = 0; i <= (durationList.length - 1); i++) {
                    outputString = outputString +
                        priorityList.elementAt(i).toString() +
                        '#' +
                        durationList.elementAt(i).toString() +
                        '\n';
                  }
                  FileManager().writeTextFile(outputString);
                  print(outputString);
                  setState(() {});
                },
                child: Text('Create file'),
              ),
              Text('Duration:' + durationList.toString()),
              Text('Priority:' + priorityList.toString()),

              //AddButton(
              // _durationctrl, _durationList, _priorityctrl, _priorityList),
            ],
          )),
    );
  }
}
