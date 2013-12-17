part of talk_to_me_test;

class TestHttp extends TestDouble implements Http{}
class TestResponse {
  final data;
  TestResponse(this.data);

  static async(data) => new Future.value(new TestResponse(data));
}

testUsersRepository(){
  group("[UsersRepository]", (){
    group("[all]", (){
      test("getting a list of users", (){
        final http = new TestHttp()
          ..stub("get").
            args("/api/users.json").
            andReturn(TestResponse.async([{"name" : "Jerry", "isOnline" : true}]));

        final repo = new UsersRepository(http);

        repo.all().then((users){
          expect(users[0].name, equals("Jerry"));
          expect(users[0].isOnline, isTrue);
        });
      });
    });
  });;
}
