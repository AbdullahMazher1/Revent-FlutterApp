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
                  topRight: Radius.circular(0),
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
      'image': 'assets/images/abd.jpg',
      'name': 'Abdullah',
      'message': 'Hi there, I was wondering if you could...',
      'time': '9:05 AM',
      'unread': 0,
    },
    {
      'image': 'assets/images/bkr.jpeg',
      'name': 'Azan',
      'message': 'Sure, Thanks',
      'time': '25 June',
      'unread': 0,
    },
    {
      'image': 'assets/images/sad.jpeg',
      'name': 'Khwaja',
      'message': 'Oye gazi chowk ana he?..',
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailScreen(
              name: chat['name'],
              image: chat['image'],
              lastMessage: chat['message'],
            ),
          ),
        );
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

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final String lastMessage;

  ChatDetailScreen({
    required this.name,
    required this.image,
    required this.lastMessage,
  });

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  List<Map<String, dynamic>> messages = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Add sender's initial message
    messages.add({
      'text': 'Oye gazi chwon ana he?', // sender's message
      'isMe': false,
    });
  }

  void sendMessage() {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          'text': controller.text.trim(),
          'isMe': true, // your message
        });
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Color(0xFF8C54B8),
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              radius: 18,
            ),
            SizedBox(width: 10),
            Text(
              widget.name,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg['isMe'] == true;

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Color(0xFF8C54B8) : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      msg['text'],
                      style: GoogleFonts.poppins(
                        color: isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      hintStyle: GoogleFonts.poppins(fontSize: 14),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: sendMessage,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF8C54B8),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
