part of talk_to_me_test;

testParseAgendaItem(){
  var parse = new ParseAgendaItem();

  describe("[AgendaItemParser]", (){
    it("parses a simple description", (){
      var item = parse("simple description");

      expect(item.description).toEqual("simple description");
      expect(item.done).toBeFalsy();
      expect(item.priority).toEqual(3);
    });

    it("parses a description with a priority", (){
      var item = parse("description !2");

      expect(item.description).toEqual("description");
      expect(item.priority).toEqual(2);
    });

    it("parses a description with a priority in the middle of the input", (){
      var item = parse("before !2 after");

      expect(item.description).toEqual("before after");
      expect(item.priority).toEqual(2);
    });

    it("ignores the priority when it is invalid", (){
      var item = parse("description !5");

      expect(item.description).toEqual("description !5");
      expect(item.priority).toEqual(3);
    });
  });
}
