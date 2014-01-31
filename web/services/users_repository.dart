part of talk_to_me;

class UsersRepository {
  Http http;

  UsersRepository(this.http);

  Future<List<User>> all() =>
    http.
    get("/api/users.json").
    then((_) => _.data).
    then((_) => _.map(_parseUser).toList());

  User _parseUser(map) => new User(map["name"], map["isOnline"]);
}