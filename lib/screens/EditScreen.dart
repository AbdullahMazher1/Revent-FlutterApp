import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '/screens/bottom_navbar.dart';

class EditScreen extends StatefulWidget {
  final String currentName;
  final String currentBio;
  final String currentProfilePic;

  EditScreen({
    required this.currentName,
    required this.currentBio,
    required this.currentProfilePic,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final Color themeColor = const Color(0xFF8C54B8);
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  int _selectedIndex = 4;

  String profilePic = '';

  @override
  void initState() {
    super.initState();
    nameController.text = widget.currentName;
    bioController.text = widget.currentBio;
    profilePic = widget.currentProfilePic;
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePic = pickedFile.path;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: themeColor,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profilePic),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.edit,
                        color: themeColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              style: GoogleFonts.poppins(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: GoogleFonts.poppins(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: bioController,
              style: GoogleFonts.poppins(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Bio',
                labelStyle: GoogleFonts.poppins(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Changes have been saved')),
                );
                Navigator.pop(context, {
                  'name': nameController.text,
                  'bio': bioController.text,
                  'profilePic': profilePic,
                });
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
