import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/constants.dart';
import 'GoogleSighnApi.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                        'Welcome To',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 106, 40, 122),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Revent',
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
                  const SizedBox(height: 10),
                  const TextBox(
                    labelText: 'Confirm Password',
                    hintText: '',
                    obscureText: true,
                  ),
                  const SizedBox(height: 45),
                  ElevatedButton(
                    onPressed: () => SignUp.new,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(260, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xFF8C54B8),
                    ),
                    child: Text(
                      'Register',
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
                        'Already have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/SignIn');
                        },
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF8C54B8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: handleSignIn,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 228, 205, 247)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/04.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Continue with Google',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: const Color(0xFF8C54B8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 100,
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/03.png',
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> handleSignIn() async {
  try{
    final user = await GoogleSignInApi.login();
    if (user != null) {
      print("Signed in successfully: ${user.displayName}");
    } else {
      print("Sign-in failed or canceled");
    }
  }catch(e){
    print(e.toString());
  }
}
