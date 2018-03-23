import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart'
    show BaseRequest, IOClient, Response, StreamedResponse;
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/people/v1.dart';
import 'dart:async';
import 'package:flutter/material.dart';

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

class GoogleClient {
  GoogleSignInAccount _currentUser;
  GoogleHttpClient httpClient;
  PeopleApi peopleApi;
  CalendarApi calendarApi;
  GoogleClient(this._currentUser);

  void getApis() async {
    Future<Map<String, String>> futureHeaders = _currentUser.authHeaders;
    Map<String, String> headers = await futureHeaders;
    final httpClient = new GoogleHttpClient(headers);
    final calendarApi = new CalendarApi(httpClient);
    final peopleApi = new PeopleApi(httpClient);
  }

  Future<Events> getCalendarEvents() async {
    var now = new DateTime.now().toUtc();
    var data = await this.calendarApi.events.list("primary",
        singleEvents: true, orderBy: 'startTime', maxResults: 10, timeMin: now);
    return data;
  }
}
