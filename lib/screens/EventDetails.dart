import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatefulWidget {
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final Color themeColor = const Color(0xFF8C54B8);

  String eventName = '';
  String eventDescription = '';
  DateTime eventDate = DateTime.now();
  String eventLocation = '';
  int numberOfTickets = 0; 

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      eventName = args['eventName'] ?? eventName;  
      eventDescription = args['eventDescription'] ?? eventDescription;
      eventDate = args['eventDate'] ?? eventDate;
      eventLocation = args['eventLocation'] ?? eventLocation;
      
      numberOfTickets = args['numberOfTickets'] ?? numberOfTickets;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Event',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 66, 66, 66),
                  ),
                ),
                Text(
                  ' Details',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 106, 40, 122),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: themeColor.withOpacity(0.2),
              ),
              child: Center(
                child: Text(
                  'Upload Event Poster',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              eventName,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 106, 40, 122),
              ),
            ),
            SizedBox(height: 5),
            Text(
              eventDescription,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.calendar_today, color: themeColor, size: 20),
                SizedBox(width: 6),
                Text(
                  'Date & Time: ${DateFormat('MMMM dd, yyyy – hh:mm a').format(eventDate)}',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.access_time, color: themeColor, size: 20),
                SizedBox(width: 6),
                Text(
                  'Created On: May 5, 2025', // Don't change
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.airplay, color: themeColor, size: 20),
                SizedBox(width: 6),
                Text(
                  'Tickets Available: $numberOfTickets',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on, color: themeColor, size: 20),
                SizedBox(width: 6),
                Text(
                  'Location: $eventLocation',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/EventTickets');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(190, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: const Color(0xFF8C54B8),
                ),
                child: Text(
                  'Generate Tickets',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Event Media',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeColor.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      color: Colors.black45,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
