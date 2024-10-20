import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBox extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;

  const TextBox({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 45,
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelText: labelText,
            labelStyle: GoogleFonts.poppins(
                fontSize: 13, color: const Color.fromARGB(255, 122, 122, 122)),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
