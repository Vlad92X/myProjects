import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
  String language;
  String locate = 'Kharkiv';

  String get city => locate;

  User.fromFirebase(FirebaseUser fUser) {
    id = fUser.uid;
  }
}
