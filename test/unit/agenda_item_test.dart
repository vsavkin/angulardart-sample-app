part of talk_to_me_test;

testAgendaItem(){
  describe("[AgendaItem]", (){
    describe("[valid]", (){
      it("is true when the description and priority fields are set", (){
        final item = new AgendaItem("description", true, 1);
        expect(item.valid).toBeTruthy();
      });

      it("is false when description is blank", (){
        final item = new AgendaItem("", true, 1);
        expect(item.valid).toBeFalsy();
      });

      it("is false when priority is blank", (){
        final item = new AgendaItem("description", true, null);
        expect(item.valid).toBeFalsy();
      });
    });
  });
}
