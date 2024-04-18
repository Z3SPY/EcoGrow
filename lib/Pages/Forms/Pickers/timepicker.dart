import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {

  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _timeOfDay.hour.toString().padLeft(2, '0') + ':' + _timeOfDay.minute.toString().padLeft(2, '0'),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30,),
            MaterialButton(
              height: 50,
              minWidth: 150,
              color: const Color(0xff1D1E22),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: const Text('Select Time', style: TextStyle(color: Colors.white),),
              onPressed: () {
                _selectTime();
              },

            )
          ],
        ),
      ),
    );  
  }

  Future <void> _selectTime() async {
    TimeOfDay? _picked = await showTimePicker(context: context, initialTime: _timeOfDay);

    if (_picked != null){
      setState(() {
        _timeOfDay = _picked;
      });
    }

  }



}