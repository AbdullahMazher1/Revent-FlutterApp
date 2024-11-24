import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/SignIn.dart';
import 'screens/SignUp.dart';
import 'screens/Interface.dart';
import 'screens/Event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstScreen(),
      routes: {
        '/SignIn': (context) => SignIn(),
        '/SignUp': (context) => SignUp(),
        '/Interface': (context) => EventScreen(),
        '/Event': (context) => Events(),
        '/EventsDisp': (context) => EventsDisp(),
        '/EventsDate': (context) => EventsDate(),
        '/EventsLocation': (context) => EventsLocation(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/01.png',
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Get things done with ',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Revent',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xFF8C54B8),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: const Color(0xFF0c0c0c),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(260, 58),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: const Color(0xFF8C54B8),
                ),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SignIn');
                    },
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: const Color(0xFF8C54B8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Circles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      height: 100,
      child: Stack(
        children: [
          Positioned(
            left: -15,
            top: 10,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple.withOpacity(0.5),
            ),
          ),
          Positioned(
            left: 30,
            top: -10,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
