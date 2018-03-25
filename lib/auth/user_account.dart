import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class UserAccount extends InheritedWidget {
  const UserAccount({
    Key key,
    this.accounts,
    Widget child}) : super(key: key, child: child);

  final Map<String, GoogleSignInAccount> accounts;

  @override
  bool updateShouldNotify(UserAccount old) {
    return accounts != old.accounts;
  }

  static UserAccount of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(UserAccount);
  }
}
