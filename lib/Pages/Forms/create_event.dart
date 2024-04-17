import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import '../GoogleMaps/location_picker.dart';

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
  List<XFile> _eventImages = [];

  Future<void> _pickEventLocation() async {
    // Show the MapPicker widget to allow the user to pick a location
    final LatLng? location = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPicker()),
    );
    if (location != null) {
      setState(() {
        _eventLocation = location;
        print('Selected location: $_eventLocation');
      });
    }
  }

  Future<void> _pickEventImages() async {
    // Use image_picker package to allow the user to pick multiple images
    final List<XFile> images = await ImagePicker().pickMultiImage();
    setState(() {
      _eventImages.addAll(images);
    });
    }

  Future<void> _saveEvent() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Save the event data to Firebase
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final eventData = {
          'title': _eventTitleController.text,
          'description': _eventDescriptionController.text,
          'startDateTime': _startDateTime,
          'endDateTime': _endDateTime,
          'location': GeoPoint(_eventLocation?.latitude ?? 0, _eventLocation?.longitude ?? 0),
          'schoolOrganization': _schoolOrganization,
          'eventType': _eventType,
          'createdBy': user.uid,
          'imageUrls': await _uploadEventImages(),
        };
        await FirebaseFirestore.instance.collection('events').add(eventData);
        // Clear the form fields
        _eventTitleController.clear();
        _eventDescriptionController.clear();
        setState(() {
          _startDateTime = DateTime.now();
          _endDateTime = DateTime.now();
          _eventLocation = null;
          _schoolOrganization = '';
          _eventType = '';
          _eventImages = [];
        });
      }
    }
  }

  Future<List<String>> _uploadEventImages() async {
    // Use Cloudinary or any other image hosting service to upload the event images
    final List<String> imageUrls = [];
    for (final image in _eventImages) {
      // Upload the image and get the URL
      imageUrls.add('https://example.com/event-image.jpg');
    }
    return imageUrls;
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
                value: _eventType.isNotEmpty ? _eventType : null,
                onChanged: (String? value) {
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
              if (_eventImages.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _eventImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Image.file(
                            File(_eventImages[index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _pickEventImages,
                child: const Text('Upload Event Images'),
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