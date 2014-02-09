part of talk_to_me_test;

class TestResponse {
  final data;
  TestResponse(this.data);

  static async(data) => new Future.value(new TestResponse(data));
}

waitForHttp(future, callback) =>
  Timer.run(expectAsync0(() {
    inject((MockHttpBackend http) => http.flush());
    future.then(callback);
  }));

testUsersRepository(){
  group("[UsersRepository - without using Angular helpers]", (){
    group("[all]", (){
      test("getting a list of users", (){
        final http = new TestDouble()
          ..stub("get").
            args("api/users.json").
            andReturn(TestResponse.async([{"name" : "Jerry", "isOnline" : true}]));

        final repo = new UsersRepository(http);

        repo.all().then((users){
          expect(users[0].name, equals("Jerry"));
          expect(users[0].isOnline, isTrue);
        });
      });
    });
  });

  group("[UsersRepository - with using Angular helpers]", () {
    setUp(setUpInjector);
    tearDown(tearDownInjector);

    group("[all]", () {
      setUp(module((Module _) => _
        ..type(MockHttpBackend)
        ..type(UsersRepository)));

      test("getting a list of users", inject((MockHttpBackend http, UsersRepository repo) {
        http.whenGET("api/users.json").respond('[{"name":"Jerry", "isOnline":true}]');

        waitForHttp(repo.all(), (users){
          expect(users[0].name, equals("Jerry"));
          expect(users[0].isOnline, isTrue);
        });
      }));
    });
  });
}
