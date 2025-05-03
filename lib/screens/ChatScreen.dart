import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8C54B8), 
      body: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chats',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.search, color: Colors.white, size: 26),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(0), // Rounded top-right corner
                ),
              ),
              child: ChatBody(),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  final List<Map<String, dynamic>> chatData = [
    {
      'image': 'assets/images/p.jpg',
      'name': 'Jay Cutler',
      'message': 'Hi there, I was wondering if you could...',
      'time': '9:05 AM',
      'unread': 0,
    },
    {
      'image': 'assets/images/p.jpg',
      'name': 'Aria Stark',
      'message': 'Sure, Thanks',
      'time': '25 June',
      'unread': 0,
    },
    {
      'image': 'assets/images/p.jpg',
      'name': 'David Jake',
      'message': 'Hi there, I was wondering if you could...',
      'time': '21 June',
      'unread': 0,
    },
    {
      'image': 'assets/images/p.jpg',
      'name': 'Bonnie Bannet',
      'message': 'Going to print it now.',
      'time': '20 June',
      'unread': 0,
    },
    {
      'image': 'assets/images/p.jpg',
      'name': 'Matt Damon',
      'message': 'At least we go with this one.',
      'time': '19 June',
      'unread': 0,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            '${chatData.length} Chats',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        ...chatData.map((chat) => ChatTile(chat)).toList(),
      ],
    );
  }
}

class ChatTile extends StatelessWidget {
  final Map<String, dynamic> chat;

  ChatTile(this.chat);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('${chat['name']} tapped');
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(chat['image']),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            chat['name'],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          Text(
            chat['time'],
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              chat['message'],
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ),
          if (chat['unread'] > 0)
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${chat['unread']}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
