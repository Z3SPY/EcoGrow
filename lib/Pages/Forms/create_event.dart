import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../GoogleMaps/location_picker.dart';
import './Pickers/datepicker.dart';
import './Pickers/timepicker.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventDescriptionController = TextEditingController();
  TimeOfDay _startDateTime = TimeOfDay.now();
  TimeOfDay _endDateTime = TimeOfDay.now();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  LatLng? _eventLocation;
  String _schoolOrganization = '';
  String _eventType = '';
  XFile? _eventImage;

  Future<void> _pickEventLocation() async {
    // Show the MapPicker widget to allow the user to pick a location
    final LatLng? location = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPicker()),
    );
    if (location != null) {
      setState(() {
        _eventLocation = location;
      });
    }
  }

  TextEditingController _startDateController = TextEditingController();
TextEditingController _endDateController = TextEditingController();

  // Function to select start date
Future<void> _selectStartDate(BuildContext context) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  if (selectedDate != null) {
    setState(() {
      _startDate = selectedDate;
      _startDateController.text = selectedDate.toString().split(" ")[0];
    });
  }
}

// Function to select end date
Future<void> _selectEndDate(BuildContext context) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  if (selectedDate != null) {
    setState(() {
      _endDate = selectedDate;
      _endDateController.text = selectedDate.toString().split(" ")[0];
    });
  }
}

Future <void> _selectStartTime() async {
    TimeOfDay? _picked = await showTimePicker(context: context, initialTime: _startDateTime);

    if (_picked != null){
      setState(() {
        _startDateTime = _picked;
      });
    }
  }

  Future <void> _selectEndTime() async {
    TimeOfDay? _picked = await showTimePicker(context: context, initialTime: _endDateTime);

    if (_picked != null){
      setState(() {
        _endDateTime = _picked;
      });
    }
  }

  Future<void> _pickEventImage() async {
    // Use image_picker package to allow the user to pick an image
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _eventImage = image;
      });
    }
  }

  Future<void> _saveEvent() async {
  if (_formKey.currentState?.validate() ?? false) {
    // Print the event data for checking
    print('Event Title: ${_eventTitleController.text}');
    print('Event Description: ${_eventDescriptionController.text}');
    print('Start DateTime: $_startDateTime');
    print('End DateTime: $_endDateTime');
    print('Start Date: ${_startDate.toString().split(" ")[0]}'); // Extract date part
    print('End Date: ${_endDate.toString().split(" ")[0]}'); // Extract date part
    print('Location: $_eventLocation');
    print('School/Organization: $_schoolOrganization');
    print('Event Type: $_eventType');

    // Save the event data to Firebase
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('events').add({
        'title': _eventTitleController.text,
        'description': _eventDescriptionController.text,
        'startDateTime': _startDateTime,
        'endDateTime': _endDateTime,
        'startDate': _startDate.toString().split(" ")[0],
        'endDate': _endDate.toString().split(" ")[0],
        'location': GeoPoint(_eventLocation?.latitude ?? 0, _eventLocation?.longitude ?? 0),
        'schoolOrganization': _schoolOrganization,
        'eventType': _eventType,
        'createdBy': user.uid,
        'imageUrl': await _uploadEventImage(),
      });
      // Clear the form fields
      _eventTitleController.clear();
      _eventDescriptionController.clear();
      setState(() {
        _startDateTime = TimeOfDay.now();
        _endDateTime = TimeOfDay.now();
        _startDate = DateTime.now();
        _endDate = DateTime.now();
        _eventLocation = null;
        _schoolOrganization = '';
        _eventType = '';
        _eventImage = null;
      });
    }
  }
}



  Future<String?> _uploadEventImage() async {
    // Use Cloudinary or any other image hosting service to upload the event image
    if (_eventImage != null) {
      // Upload the image and get the URL
      return 'https://example.com/event-image.jpg';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Offset
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        // Change this
                        TextFormField(
                          controller: _eventTitleController,
                          decoration: const InputDecoration(
                              hintText: 'Event Title',
                              border: InputBorder.none, // Remove the underline
                              hintStyle: TextStyle(color: Colors.green)),
                          style: TextStyle(color: Colors.green),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an event title';
                            }
                            return null;
                          },
                        ),
                        Divider(),
                        TextFormField(
                          controller: _eventDescriptionController,
                          decoration: const InputDecoration(
                              hintText: 'Event Description',
                              border: InputBorder.none, // Remove the underline
                              hintStyle: TextStyle(color: Colors.green)),
                          style: TextStyle(color: Colors.green),
                          maxLines: 3, //CHANGE THIS
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an event description';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Offset
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month, color: Colors.green), // Example icon
                              SizedBox(width: 8), // Adjust the spacing between the icon and text
                              Text(
                                'Event Date & Time',
                                style: TextStyle(fontSize: 16, color: Colors.green), // Example text style
                              ),
                            ],
                          ),
                        ),
                        Divider(),
Padding(
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  child: Row(
    children: [
      Text('Start:'),
      SizedBox(width: 10),
      Expanded(
        child: TextFormField(
          controller: _startDateController,
          readOnly: true,
          onTap: () => _selectStartDate(context),
          decoration: InputDecoration(
            labelText: 'Start Date',
            prefixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ),
      SizedBox(width: 10),
       Expanded(
                      child: ElevatedButton(
                        onPressed: _selectStartTime,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(width: 8.0),
                            Text(
                              '${_startDateTime.hour.toString().padLeft(2, '0')}:${_startDateTime.minute.toString().padLeft(2, '0')}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
      // Expanded(
      //   child: Text(
      //     "9:00 PM",
      //     style: TextStyle(
      //       color: Color.fromRGBO(45, 143, 72, 1),
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    ],
  ),
),

// End

  Padding(
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  child: Row(
    children: [
      Text('End:'),
      SizedBox(width: 10),
      Expanded(
        child: TextFormField(
          controller: _endDateController,
          readOnly: true,
          onTap: () => _selectEndDate(context),
          decoration: InputDecoration(
            labelText: 'End Date',
            prefixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ),
      SizedBox(width: 10),
       Expanded(
                      child: ElevatedButton(
                        onPressed: _selectEndTime,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(width: 8.0),
                            Text(
                              '${_endDateTime.hour.toString().padLeft(2, '0')}:${_endDateTime.minute.toString().padLeft(2, '0')}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
      // Expanded(
      //   child: Text(
      //     "9:00 PM",
      //     style: TextStyle(
      //       color: Color.fromRGBO(45, 143, 72, 1),
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    ],
  ),
),


                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: _pickEventLocation,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.location_pin, color: Colors.green), // Example icon
                            SizedBox(width: 8), // Adjust the spacing between the icon and text
                            Text(
                              'Pick a Location',
                              style: TextStyle(fontSize: 16, color: Colors.green), // Example text style
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //EVENT TYPE and ORGANIZATION
                  const SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _schoolOrganization = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'School/Organization',
                        border: InputBorder.none, // Remove the underline
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a school or organization';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButtonFormField<String>(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      value: _eventType.isNotEmpty ? _eventType : null,
                      onChanged: (String? value) {
                        setState(() {
                          _eventType = value ?? '';
                        });
                      },
                      items: const [
                        DropdownMenuItem(value: 'Tree Planting', child: Text('Tree Planting')),
                        DropdownMenuItem(value: 'Feeding Program', child: Text('Feeding Program')),
                        DropdownMenuItem(value: 'Donation Drive', child: Text('Donation Drive')),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Event Type',
                        border: InputBorder.none, // Remove the underline
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an event type';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _pickEventImage,
                    child: const Text('Upload Event Image'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _saveEvent,
                    child: const Text('Save Event'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
