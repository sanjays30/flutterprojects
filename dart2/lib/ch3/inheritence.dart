import 'package:meta/meta.dart';

main(List<String> args) {
  AuthenticatedUser user = AuthenticatedUser.withtoken(
      idToken: "ssddsds", id: "112212", email: "ssss@ddd.com");
  user.createdBy = "bob";
  user.createdOn = DateTime.now();
  print(user.id);
}

//inheritence with mixin
class AuthenticatedUser extends User with Audit {
  String idToken;
  DateTime tokenExpiryTime;
  String refreshToken;
  AuthenticatedUser.withtoken(
      {@required id, @required email, @required this.idToken})
      : super(id, email);
}

class Audit {
  String createdBy;
  DateTime createdOn;
  String updatedBy;
  DateTime updatedOn;
}

class User {
  final String id;
  final String email;

  User(this.id, this.email);
}

class OAthUser implements User {
  @override
  String get email => null;

  @override
  String get id => null;
}
