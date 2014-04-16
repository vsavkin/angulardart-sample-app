part of talk_to_me_test;

class CallStorageTestDouble extends TestDouble implements CallStorage {}
class RouterTestDouble extends TestDouble implements Router {}

testCreateCallCtrl(){
  group("[CreateCallCtrl]", (){
    group("[create]", (){
      var storage, router;

      setUp((){
        storage = new CallStorageTestDouble();
        router = new RouterTestDouble();

        storage.stub("store").andReturn("ID");
        router.stub("go");
      });

      test("storing the call", (){
        final c = new CreateCallCtrl(storage, router);

        storage.shouldReceive("store").args(c.call);

        c.create();

        storage.verify();
      });

      test("redirecting to the show url", (){
        final c = new CreateCallCtrl(storage, router);

        router.shouldReceive("go").args("list.show", {"callId": "ID"});

        c.create();

        router.verify();
      });
    });
  });
}
