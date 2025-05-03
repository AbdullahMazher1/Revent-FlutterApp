import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String eventName = "";
String eventDescription = "";
DateTime? eventDate;
String eventLocation = "";

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  TextEditingController _eventNameController = TextEditingController();

  @override
  void dispose() {
    _eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/e5.png',
              width: 300,
              height: 320,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Give your',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  ' Event ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF8C54B8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'a name',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: TextField(
                controller: _eventNameController,
                decoration: const InputDecoration(
                  label: Text(
                    'Choose a short & distinct name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 0.25,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xFF8C54B8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        onPressed: () {
          eventName = _eventNameController.text;
          Navigator.pushNamed(context, '/EventsDisp');
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: const CircleBorder(),
        mini: false,
      ),
    );
  }
}

class EventsDisp extends StatefulWidget {
  @override
  _EventsDispState createState() => _EventsDispState();
}

class _EventsDispState extends State<EventsDisp> {
  TextEditingController _eventDescriptionController = TextEditingController();

  @override
  void dispose() {
    _eventDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/e6.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Give your',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  ' Event ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF8C54B8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'a description',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: TextField(
                controller: _eventDescriptionController,
                decoration: const InputDecoration(
                  label: Text(
                    'Let people know what to expect',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 0.50,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xFF8C54B8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        onPressed: () {
          eventDescription = _eventDescriptionController.text;
          Navigator.pushNamed(context, '/EventsDate');
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: const CircleBorder(),
        mini: false,
      ),
    );
  }
}

class EventsDate extends StatefulWidget {
  @override
  _EventsDateState createState() => _EventsDateState();
}

class _EventsDateState extends State<EventsDate> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/e3.png',
              width: 250,
              height: 280,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Give your',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  ' Event ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF8C54B8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'a Date',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  height: 50,
                  width: 270,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 176, 116, 231)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Tap to select the date'
                            : '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}', // Display selected date
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: _selectedDate == null
                              ? const Color.fromARGB(255, 110, 110, 110)
                              : Colors.black,
                        ),
                      ),
                      const Icon(Icons.calendar_today,
                          color: Color.fromARGB(255, 176, 116, 231)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xFF8C54B8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        onPressed: () {
          eventDate = _selectedDate;
          Navigator.pushNamed(context, '/EventsLocation');
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: const CircleBorder(),
        mini: false,
      ),
    );
  }
}

class EventsLocation extends StatefulWidget {
  @override
  _EventsLocationState createState() => _EventsLocationState();
}

class _EventsLocationState extends State<EventsLocation> {
  TextEditingController _eventLocationController = TextEditingController();

  @override
  void dispose() {
    _eventLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/location.png',
              width: 300,
              height: 320,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Give your',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  ' Event ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF8C54B8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'a location',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: TextField(
                controller: _eventLocationController,
                decoration: const InputDecoration(
                  label: Text(
                    'Where will it be?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 1.00,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xFF8C54B8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        onPressed: () {
         ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Event has been generated.'),
            ),
          );
          eventLocation = _eventLocationController.text;
          Navigator.pushNamed(
            context,
            '/UserScreen',
            arguments: {
              'eventName': eventName,
              'eventDescription': eventDescription,
              'eventDate': eventDate!,
              'eventLocation': eventLocation,
            },
          );
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: const CircleBorder(),
        mini: false,
      ),
    );
  }
}

