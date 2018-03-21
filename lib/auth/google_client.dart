import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart'
    show BaseRequest, IOClient, Response, StreamedResponse;
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/people/v1.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:googleapis_auth/auth_browser.dart';
//import 'package:googleapis_auth/auth_io.dart';

/// Singleton object for interacting with google APIs.
///
/// The goals here is to support google sign-in on the client device, and also
/// obtain authorization for any backend BrightPig services to access the google
/// APIs.
///
/// The Native APIs provide the ability to obtain a server side a `AuthCode`
/// (e.g.  GoogleSignInOptions.Builder requestServerAuthCode) but this is not
/// implemented in the flutter plugin.
///
/// see:  flutter/plugins/.../google_sign_in/android/
///       io.flutter.plugins.googlesignin.GoogleSignInPlugin.java:208
///
/// Further more there is some dependency issue with the google-service gradle
/// plugin and the boilerplate config, but example firebase_auth application
/// somehow makes this work, so copying that should work.

import 'dart:async';



class GoogleHttpClient extends IOClient {
  Map<String, String> _headers;
  GoogleHttpClient(this._headers) : super();

  @override
  Future<StreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Object url, {Map<String, String> headers}) =>
      super.head(url, headers: headers..addAll(_headers));
}
abstract class Client{

  bool isLoggedIn();
}

class GoogleClient extends Client{
  ///
  static GoogleSignInAccount _currentUser;
  CalendarApi calendarApi;
  PeopleApi peopleApi;

  /// Make a function that fills this in 
  static GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      "https://www.googleapis.com/auth/calendar",
      "https://mail.google.com/",
    ],
  );

  
  /// :) not sure what _internal does just yet...
  static final _instance = new GoogleClient._internal();
  GoogleClient._internal();

  factory GoogleClient() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
      _instance._syncHeaders(account.authHeaders);
    });

    return _instance;
  }

  void _syncHeaders(Future<Map<String, String>> authHeaders) async {
    final headers = await authHeaders;

    final httpClient = new GoogleHttpClient(headers);
    this.calendarApi = new CalendarApi(httpClient);
    this.peopleApi = new PeopleApi(httpClient);

    var now = new DateTime.now().toUtc();

    var data = await calendarApi.events.list("primary",
        singleEvents: true, orderBy: 'startTime', maxResults: 10, timeMin: now);

    print(data);
  }

  ///
  Future<Null> doGooglesignIn() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn();
    } catch (error) {
      print("Error signing in");
      print(error);
    }
  }

  @override
  bool isLoggedIn() {
    return _currentUser != null;
  }
}
