part of talk_to_me_test;

testAgendaItem(){
  group("[AgendaItem]", (){
    group("[valid]", (){
      test("is true when the description and priority fields are set", (){
        final item = new AgendaItem("description", true, 1);
        expect(item.valid, isTrue);
      });

      test("is false when description is blank", (){
        final item = new AgendaItem("", true, 1);
        expect(item.valid, isFalse);
      });

      test("is false when priority is blank", (){
        final item = new AgendaItem("description", true, null);
        expect(item.valid, isFalse);
      });
    });
  });
}
