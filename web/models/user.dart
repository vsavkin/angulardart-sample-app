part of talk_to_me;

class User {
  String name;
  bool isOnline;

  User(this.name, this.isOnline);

  String toString() => "${name} - ${isOnline}";
}
