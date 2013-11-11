part of talk_to_me_test;

testParseAgendaItem(){
  var parse = new ParseAgendaItem();

  group("[AgendaItemParser]", (){
    test("parses a simple description", (){
      var item = parse("simple description");

      expect(item.description, equals("simple description"));
      expect(item.done, equals(false));
      expect(item.priority, equals(3));
    });

    test("parses a description with a priority", (){
      var item = parse("description !2");

      expect(item.description, equals("description"));
      expect(item.priority, equals(2));
    });

    test("parses a description with a priority in the middle of the input", (){
      var item = parse("before !2 after");

      expect(item.description, equals("before after"));
      expect(item.priority, equals(2));
    });

    test("ignores the priority when it is invalid", (){
      var item = parse("description !5");

      expect(item.description, equals("description !5"));
      expect(item.priority, equals(3));
    });
  });
}
