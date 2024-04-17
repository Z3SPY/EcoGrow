import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventDescriptionController = TextEditingController();
  DateTime _startDateTime = DateTime.now();
  DateTime _endDateTime = DateTime.now();
  LatLng? _eventLocation;
  String _schoolOrganization = '';
  String _eventType = '';
  XFile? _eventImage;

 Future<void> _pickEventLocation() async {
  // Use Google Maps API to allow the user to pick a location
  final LatLng? location = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GoogleMapsPlacePicker(
        apiKey: 'YOUR_GOOGLE_MAPS_API_KEY',
        initialPosition: const LatLng(37.7749, -122.4194),
        useCurrentLocation: true,
        selectInitialPosition: true,
        usePinPointingSearch: true,
        usePlaceDetailSearch: true,
        onPlacePicked: (result) {
          Navigator.of(context).pop(LatLng(
            result.latLng.latitude,
            result.latLng.longitude,
          ));
          return;
        },
      ),
    ),
  );

  if (location != null) {
    setState(() {
      _eventLocation = location;
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
      // Save the event data to Firebase
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('events').add({
          'title': _eventTitleController.text,
          'description': _eventDescriptionController.text,
          'startDateTime': _startDateTime,
          'endDateTime': _endDateTime,
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
          _startDateTime = DateTime.now();
          _endDateTime = DateTime.now();
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _eventTitleController,
                decoration: const InputDecoration(
                  hintText: 'Event Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an event title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _eventDescriptionController,
                decoration: const InputDecoration(
                  hintText: 'Event Description',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an event description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Show a date/time picker for the start datetime
                      },
                      child: Text('Start: $_startDateTime'),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Show a date/time picker for the end datetime
                      },
                      child: Text('End: $_endDateTime'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _pickEventLocation,
                child: const Text('Pick Event Location'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _schoolOrganization = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'School/Organization',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a school or organization';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _eventType,
                onChanged: (value) {
                  setState(() {
                    _eventType = value ?? '';
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'Workshop', child: Text('Workshop')),
                  DropdownMenuItem(value: 'Meetup', child: Text('Meetup')),
                  DropdownMenuItem(value: 'Conference', child: Text('Conference')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Event Type',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an event type';
                  }
                  return null;
                },
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
    );
  }
}