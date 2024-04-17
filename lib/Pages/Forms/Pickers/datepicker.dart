import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final void Function(DateTime)? onDateSelected;

  const DatePicker({Key? key, this.onDateSelected}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'DATE',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? selectedDate = await _selectDate(context);
              if (selectedDate != null) {
                widget.onDateSelected?.call(selectedDate);
                setState(() {
                  _dateController.text = selectedDate.toString().split(" ")[0];
                });
              }
            },
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
}
