import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String eventName = "";
String eventDescription = "";

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
              'assets/images/e3.png',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
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
                groupId: Icon(Icons.person,
                    color: Color.fromARGB(255, 176, 116, 231)),
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
        child: Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: CircleBorder(),
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
              'assets/images/e3.png',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
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
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 0.50,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(const Color(0xFF8C54B8)),
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
        child: Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: CircleBorder(),
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
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  height: 50,
                  width: 270,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 176, 116, 231)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              ? Color.fromARGB(255, 110, 110, 110)
                              : Colors.black,
                        ),
                      ),
                      Icon(Icons.calendar_today,
                          color: const Color.fromARGB(255, 176, 116, 231)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(const Color(0xFF8C54B8)),
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
          //_selectedDate
          Navigator.pushNamed(context, '/EventsLocation');
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: CircleBorder(),
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
  LatLng? _selectedLocation;

  void _selectLocation(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
  }

  Future<void> _openMapDialog(BuildContext context) async {
    LatLng? pickedLocation = await showDialog<LatLng>(
      context: context,
      builder: (BuildContext context) {
        LatLng? tempLocation;
        return AlertDialog(
          title: Text(
            "Select Event Location",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194),
                zoom: 12,
              ),
              onTap: (LatLng location) {
                tempLocation = location;
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel", style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("Confirm"),
              onPressed: () => Navigator.pop(context, tempLocation),
            ),
          ],
        );
      },
    );

    if (pickedLocation != null) {
      _selectLocation(pickedLocation);
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
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
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
                  'a Location',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: GestureDetector(
                onTap: () => _openMapDialog(context),
                child: Container(
                  height: 50,
                  width: 270,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 176, 116, 231)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedLocation == null
                            ? 'Tap to select the location'
                            : 'Lat: ${_selectedLocation!.latitude.toStringAsFixed(2)}, Lng: ${_selectedLocation!.longitude.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: _selectedLocation == null
                              ? Color.fromARGB(255, 110, 110, 110)
                              : Colors.black,
                        ),
                      ),
                      Icon(Icons.location_on,
                          color: const Color.fromARGB(255, 176, 116, 231)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 1,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(const Color(0xFF8C54B8)),
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
          //_selectedLocation
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.purple,
        ),
        tooltip: 'Next',
        shape: CircleBorder(),
        mini: false,
      ),
    );
  }
}
