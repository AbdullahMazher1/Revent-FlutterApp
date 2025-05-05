import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

int currentIndex = 0;

class _EventScreenState extends State<EventScreen> {
  void _callScreen(int index) {
    setState(() {
      currentIndex = index;
      if (currentIndex == 2) {
        Navigator.pushNamed(context, '/Event');
      }
      if (currentIndex == 4) {
        Navigator.pushNamed(context, '/UserScreen');
      }
    });
  }

  void _navigateToEventDetails2(String imageUrl, String title, String location) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetails2(
          imageUrl: imageUrl,
          title: title,
          location: location,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/p.jpg'),
            ),
            SizedBox(width: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hi, ',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Alina!',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.chat_bubble_outline, color: Colors.purple),
              onPressed: () {
                Navigator.pushNamed(context, '/ChatScreen');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Explore the world!',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for events',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.filter_alt_outlined, color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Popular Events',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CategoryButton(label: 'Most Viewed', isSelected: true),
                CategoryButton(label: 'Nearby'),
                CategoryButton(label: 'Latest'),
                Spacer(),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                GestureDetector(
                  onTap: () => _navigateToEventDetails2(
                    'assets/images/main.jpg',
                    'Marriage Ceremony',
                    'Queen Hall, Johar Town',
                  ),
                  child: EventCard(
                    imageUrl: 'assets/images/main.jpg',
                    title: 'Marriage Ceremony',
                    location: 'Queen Hall, Johar Town',
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RelatedEventCard(
                          imageUrl: 'assets/images/a.jpg',
                          title: 'Birthday Ceremony'),
                      RelatedEventCard(
                          imageUrl: 'assets/images/b.jpg',
                          title: 'Music Festival'),
                      RelatedEventCard(
                          imageUrl: 'assets/images/c.jpg',
                          title: 'Food Fair'),
                      RelatedEventCard(
                          imageUrl: 'assets/images/a.jpg',
                          title: 'Birthday Ceremony'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _navigateToEventDetails2(
                    'assets/images/z1.jpg',
                    'Live Concert',
                    'Open Air Theatre, Downtown',
                  ),
                  child: EventCard(
                    imageUrl: 'assets/images/z1.jpg',
                    title: 'Live Concert',
                    location: 'Open Air Theatre, Downtown',
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _navigateToEventDetails2(
                    'assets/images/z2.jpg',
                    'Art Exhibition',
                    'City Art Gallery',
                  ),
                  child: EventCard(
                    imageUrl: 'assets/images/z2.jpg',
                    title: 'Art Exhibition',
                    location: 'City Art Gallery',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Related Events',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _callScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryButton({
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;

  const EventCard({
    required this.imageUrl,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 14),
                    SizedBox(width: 5),
                    Text(
                      location,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RelatedEventCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RelatedEventCard({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetails2 extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;

  const EventDetails2({
    required this.imageUrl,
    required this.title,
    required this.location,
  });

  @override
  _EventDetails2State createState() => _EventDetails2State();
}

class _EventDetails2State extends State<EventDetails2> {
  String buttonText = 'Register Event';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _showRegistrationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Register for Event',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty) {
                    setState(() {
                      buttonText = 'Registered';
                    });
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8C54B8),
                ),
                child: Text('OK',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details", style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.purple),
                SizedBox(width: 5),
                Text(widget.location, style: GoogleFonts.poppins()),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.purple),
                SizedBox(width: 5),
                Text("12th Dec 2025", style: GoogleFonts.poppins()),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.purple),
                SizedBox(width: 5),
                Text("7:00 PM", style: GoogleFonts.poppins()),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "About the Event",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              "This is a dummy event description. Enjoy music, fun, and food at the event. Make sure to register and grab your seat!",
              style: GoogleFonts.poppins(),
            ),
            SizedBox(height: 20),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ElevatedButton(
                onPressed: () {
                  _showRegistrationSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(190, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: const Color(0xFF8C54B8),
                ),
                child: Text(
                  buttonText,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}