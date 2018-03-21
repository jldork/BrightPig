import 'google_client.dart';

abstract class UserAccount {
  // API Client to store user authentication
  // May be extended to include Dropbox/Outlook/etc.
  final googleClient = new GoogleClient();
  bool get isLoggedIn => googleClient.isLoggedIn();
}
