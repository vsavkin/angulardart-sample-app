part of talk_to_me;

class User {
  String name;
  bool isOnline;

  User(this.name, this.isOnline);

  toString() => "${name} - ${isOnline}";
}
