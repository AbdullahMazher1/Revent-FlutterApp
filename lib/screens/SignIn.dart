import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/constants.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 106, 40, 122),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const TextBox(
                    labelText: 'Email/Username',
                    hintText: '',
                  ),
                  const SizedBox(height: 10),
                  const TextBox(
                    labelText: 'Password',
                    hintText: '',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.pushNamed(context, '/Interface'),
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: const Color(0xFF8C54B8),
                          ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 54, 9, 63),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/SignUp');
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF8C54B8),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -50,
            top: 32,
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/02.png',
                width: 420,
                height: 420,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
