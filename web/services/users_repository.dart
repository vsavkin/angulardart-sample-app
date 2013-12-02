part of talk_to_me;

class UsersRepository {
  Http http;

  UsersRepository(this.http);

  Future<List<User>> all() =>
    http.
    get("/easyconf/web/api/users.json", interceptors: new DefaultTransformDataHttpInterceptor()).
    then((_) => _.data).
    then((_) => _.map(_parseUser).toList());

  _parseUser(map) => new User(map["name"], map["isOnline"]);
}