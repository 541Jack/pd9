import 'package:flutter/material.dart';
import 'package:pd9/InputBox.dart';
import 'package:pd9/control.dart';
import 'package:provider/provider.dart';
import './button.dart';
import './testing.dart';
import './control.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String finalResponse = '';
  String deletedResponse = '';
  final _formkey = GlobalKey<FormState>();
  List<int> intOrder = [];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextEditingController _durationctrl = TextEditingController();
    final TextEditingController _priorityctrl = TextEditingController();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Auto-Schedule App'),
          ),
          body: Column(
            children: [
              TextField(
                controller: _durationctrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Please Enter the Procession Time of Event',
                  labelText: 'Processing Time',
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
                  setState(() {
                    durationList = [];
                    priorityList = [];
                  });
                },
                child: Text('Clear'),
              ),
              RaisedButton(
                onPressed: () async {
                  for (int i = 0; i <= (durationList.length - 1); i++) {
                    outputString = outputString +
                        durationList.elementAt(i).toString() +
                        '#' +
                        priorityList.elementAt(i).toString() +
                        '\n';
                  }

                  final url = 'http://10.0.2.2:5000/name';

                  final response = await http.post(Uri.parse(url),
                      body: json.encode({'name': outputString}));
                },
                child: Text('Create file'),
              ),
              RaisedButton(
                onPressed: () async {
                  final url = 'http://10.0.2.2:5000/name';

                  final response = await http.get(Uri.parse(url));

                  final decoded = json.decode(response.body);

                  setState(() {
                    finalResponse = decoded['name'];
                  });
                  deletedResponse =
                      finalResponse.substring(0, finalResponse.length - 2);
                  //Getting flowtime
                  List<String> result = finalResponse.split(', ');
                  result.removeLast();
                  List<int> intOrder = result.map(int.parse).toList();

                  setState(() {});
                },
                child: Text('Get Result'),
              ),
              Text('Processing Time:' + durationList.toString()),
              Text('Priority:' + priorityList.toString()),
              Text('Event should be executed in the order of: ' +
                  deletedResponse),
              //AddButton(
              // _durationctrl, _durationList, _priorityctrl, _priorityList),
            ],
          )),
    );
  }
}
