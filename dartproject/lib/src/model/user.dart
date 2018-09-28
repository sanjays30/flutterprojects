import 'package:meta/meta.dart';

class User {
  final String id;
  final String email;
  String idToken;
  DateTime tokenExpiryTime;
  String refreshToken;

  User({@required this.id, @required this.email});
  User.withtoken(
      {@required this.id, @required this.email, @required this.idToken});
}
