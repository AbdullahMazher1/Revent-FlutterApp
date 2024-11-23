import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(
      clientId:
          '373596999346-7jb70ftrlplults4gkae6j30ria3ks8p.apps.googleusercontent.com');

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future<void> logout() => _googleSignIn.signOut();
}
