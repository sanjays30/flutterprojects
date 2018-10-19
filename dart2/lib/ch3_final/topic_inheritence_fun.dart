main(List<String> args) {
  OAthUser user = OAthUser("aaa", "dsdd@sdd.com");
  print(user.id);
}

class User {
  final String id;
  final String email;

  User(this.id, this.email);
  String getEmail() {
    return email;
  }

  String getId() {
    return id;
  }
}
//fun fact: You can even implement a class since all classes have implicit interfaces.
class OAthUser implements User {
  String id;
  String email;
  OAthUser(this.id, this.email) {}

  @override
  String getEmail() => email;

  @override
  String getId() => id;
}
