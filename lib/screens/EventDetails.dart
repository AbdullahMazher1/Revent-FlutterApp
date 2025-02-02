import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetails extends StatelessWidget {
  final Color themeColor = const Color(0xFF8C54B8); // Theme Color

  @override
  Widget build(BuildContext context) {
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
                  'Event Poster',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Lahore Youth Festival - 2025',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 106, 40, 122),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo justo et dolor ullamcorper, sed laoreet elit varius.',
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
                  'Date & Time: September 10, 2024',
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
                  'Created On: August 20, 2024',
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
                  'Tickets Sold: 122/200',
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
                  'Location: Grand Hall, Downtown',
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
