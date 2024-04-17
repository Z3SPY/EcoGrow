import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context){
    TimeOfDay selectedTime = TimeOfDay.now();
    String chosenTime = "Select Time";
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("${selectedTime.hour}:${selectedTime.minute}"),
        ElevatedButton(onPressed: () async {
          final TimeOfDay? timeOfDay = await showTimePicker(context: context, initialTime: selectedTime,
          initialEntryMode: TimePickerEntryMode.input,);
          if (timeOfDay != null) {
            setState(() {
              selectedTime = timeOfDay; 
            });
          }

        }, child: Text(chosenTime))
      ],
    ));
  }
}