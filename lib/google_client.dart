import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

/// Singleton object for interacting with google APIs.
///
/// The goals here is to support google sign-in on the
/// client device, and also obtain authorization for
/// any backend BrightPig services to access the google
/// APIs.
class GoogleClient {
  ///
  static GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      "https://www.googleapis.com/auth/calendar",
      "https://mail.google.com/",
    ],
  );

  ///
  static GoogleSignInAccount _currentUser;

  ///
  static final _instance = new GoogleClient._internal();

  GoogleClient._internal();

  factory GoogleClient() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;

      print(account.displayName);

      ///
      account.authentication.then((GoogleSignInAuthentication auth) {

        // ARG!
        // flutter/plugins/blob/master/packages/google_sign_in/android/src/main/java/io/flutter/plugins/googlesignin/
        //
        // GoogleSignInPlugin.java:208 ?!?!?!
        print("Id Token: ${auth.idToken}");
        print("Access Token: ${auth.accessToken}");
      });
    });

    GoogleClient.doGooglesignIn();

    return _instance;
  }

  ///
  static Future<Null> doGooglesignIn() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn();

      final GoogleSignInAuthentication auth =
          await _googleSignIn.currentUser.authentication;
    } catch (error) {
      print("Error signing in");
      print(error);
    }
  }
}
