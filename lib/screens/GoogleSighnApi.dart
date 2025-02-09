import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
      'openid', // Ensure this is included for ID tokens
    ],
    serverClientId: '222690904040-dg4dqctqdfqsvfgm7ahpo3ts7lk0pust.apps.googleusercontent.com'
  );
      // clientId:
      //     '222690904040-aookp0pb8mp8gd11tjrdnudht8ju80kt.apps.googleusercontent.com');

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future<void> logout() => _googleSignIn.signOut();
}
