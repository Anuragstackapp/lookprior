import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSign{
  GoogleSignInAccount? _googleUser;
  Future<void> signInGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          ///TODO: put scopes app will use
        ],
      );
      /// if previously signed in, it will signin silently
      /// if not, the signin dialog/login page will pop up
      _googleUser =
          await googleSignIn.signInSilently() ?? await googleSignIn.signIn();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///sign out from google
  Future<void> signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    _googleUser = null;
  }
}