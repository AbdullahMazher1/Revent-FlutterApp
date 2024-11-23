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
    });
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
            child: Icon(Icons.notifications, color: Colors.purple),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore the world!',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for events',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon:
                    Icon(Icons.filter_alt_outlined, color: Colors.purple),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CategoryButton(label: 'Most Viewed', isSelected: true),
                CategoryButton(label: 'Nearby'),
                CategoryButton(label: 'Latest'),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                EventCard(
                  imageUrl: 'assets/images/main.jpg',
                  title: 'Marriage Ceremony',
                  location: 'Queen Hall, Johar Town',
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
                          imageUrl: 'assets/images/c.jpg', title: 'Food Fair'),
                      RelatedEventCard(
                          imageUrl: 'assets/images/a.jpg',
                          title: 'Birthday Ceremony'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                EventCard(
                  imageUrl: 'assets/images/z1.jpg',
                  title: 'Live Concert',
                  location: 'Open Air Theatre, Downtown',
                ),
                SizedBox(height: 10),
                EventCard(
                  imageUrl: 'assets/images/z2.jpg',
                  title: 'Art Exhibition',
                  location: 'City Art Gallery',
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
