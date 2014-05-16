part of talk_to_me_test;

class TestResponse {
  final data;
  TestResponse(this.data);

  static async(data) => new Future.value(new TestResponse(data));
}

waitForHttp(future, callback) =>
  scheduleMicrotask(() {
    inject((MockHttpBackend http) => http.flush());
    future.then(callback);
  });

class HttpTestDouble extends TestDouble implements Http {}

testUsersRepository(){
  describe("[UsersRepository - without using Angular helpers]", (){
    describe("[all]", (){
      it("gets a list of users", (){
        final http = new HttpTestDouble()
          ..stub("get").
            args("api/users.json").
            andReturn(TestResponse.async([{"name" : "Jerry", "isOnline" : true}]));

        final repo = new UsersRepository(http);

        repo.all().then((users){
          expect(users[0].name).toEqual("Jerry");
          expect(users[0].isOnline).toBeTruthy();
        });
      });
    });
  });

  describe("[UsersRepository - with using Angular helpers]", () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    describe("[all]", () {
      beforeEach(module((Module _) => _
        ..type(MockHttpBackend)
        ..type(UsersRepository)));

      it("gets a list of users", inject((MockHttpBackend http, UsersRepository repo) {
        http.whenGET("api/users.json").respond('[{"name":"Jerry", "isOnline":true}]');

        waitForHttp(repo.all(), (users) {
          expect(users[0].name).toEqual("Jerry");
          expect(users[0].isOnline).toBeTruthy();
        });
      }));
    });
  });
}
