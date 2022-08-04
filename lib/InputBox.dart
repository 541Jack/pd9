import 'package:flutter/material.dart';

class DurationBox extends StatelessWidget {
  TextEditingController duration = TextEditingController();

  DurationBox(duration);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: duration,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Please Enter the Duration of Event',
        labelText: 'Event Duration',
      ),
      keyboardType: TextInputType.number,
    );
  }
}

class PriorityBox extends StatelessWidget {
  TextEditingController _priority = TextEditingController();

  PriorityBox(_priority);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Please Enter the Priority of Event',
          labelText: 'Event Priorty'),
      keyboardType: TextInputType.number,
    );
  }
}
