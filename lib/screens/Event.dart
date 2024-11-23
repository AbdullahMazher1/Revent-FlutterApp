import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> eventFields = [
    {
      'title': 'Give your Event a name',
      'image': 'assets/images/e3.png',
      'labelText': 'Choose a short & distinct name',
    },
    {
      'title': 'Describe your Event',
      'image': 'assets/images/e3.png',
      'labelText': 'Provide a brief description',
    },
    {
      'title': 'Choose the Event Date',
      'image': 'assets/images/e3.png',
      'labelText': 'Select an event date',
    },
    {
      'title': 'Set Event Location',
      'image': 'assets/images/e3.png',
      'labelText': 'Enter the event location',
    },
  ];

  void _nextPage() {
    setState(() {
      if (_currentIndex < eventFields.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  double _progress() {
    return (_currentIndex + 1) / eventFields.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              eventFields[_currentIndex]['image'],
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  eventFields[_currentIndex]['title'],
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF8C54B8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: eventFields[_currentIndex]['labelText'],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
              child: LinearProgressIndicator(
                value: _progress(),
                backgroundColor: Colors.grey[300],
                color: const Color(0xFF8C54B8),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_currentIndex > 0)
            FloatingActionButton(
              onPressed: _previousPage,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              tooltip: 'Back',
              shape: CircleBorder(),
              mini: true,
            ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 243, 243, 243),
            onPressed: _nextPage,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.purple,
            ),
            tooltip: 'Next',
            shape: CircleBorder(),
            mini: false,
          ),
        ],
      ),
    );
  }
}
