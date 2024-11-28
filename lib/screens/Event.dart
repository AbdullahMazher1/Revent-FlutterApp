import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
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
                groupId: const Icon(Icons.person,
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
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
          //_selectedDate
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
  GoogleMapController? mapController;
  LatLng _center = const LatLng(37.7749, -122.4194); // Default to San Francisco
  LatLng _pickedLocation =
      const LatLng(37.7749, -122.4194); // Default pick location
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isDenied) {
      // Handle the case where permission is denied
      print('Location permission denied');
    } else {
      // Location permission granted
      print('Location permission granted');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onTap(LatLng location) {
    setState(() {
      _pickedLocation = location;
      _markers = {
        Marker(
          markerId: MarkerId("selected_location"),
          position: _pickedLocation,
        ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Event Location"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 10.0,
              ),
              onTap: _onTap,
              markers: _markers,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle selected location
                print(
                    "Selected Location: ${_pickedLocation.latitude}, ${_pickedLocation.longitude}");
              },
              child: const Text("Confirm Location"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          // Proceed with the selected location
          print(
              'Selected Location: ${_pickedLocation.latitude}, ${_pickedLocation.longitude}');
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        tooltip: 'Next',
        shape: const CircleBorder(),
        mini: false,
      ),
    );
  }
}
