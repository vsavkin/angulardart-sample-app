part of talk_to_me_test;

loadTemplates(List<String> templates){
  updateCache(template, response) => inject((TemplateCache cache) => cache.put(template, response));

  final futures = templates.map((template) =>
    html.HttpRequest.request('packages/talk_to_me/' + template.substring(4), method: "GET").
    then((_) => updateCache(template, new HttpResponse(200, _.response))));

  return Future.wait(futures);
}

compileComponent(String html, Map scope, callback){
  return async(() {
    inject((TestBed tb) {
      final s = tb.rootScope.createChild(scope);
      final el = tb.compile(html, scope: s);

      microLeap();

      digest();

      callback(el);
    });
  });
}

digest(){
  inject((TestBed tb) { tb.rootScope.apply(); });
}

testAgendaItemComponent(){;
  describe("[AgendaItemComponent]", () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    describe("[swiching between modes]", () {
      html() => '<agenda-item item="item" agenda="agenda"></agenda-item>';
      scope() => {"item" : new AgendaItem("description", true, 1), "agenda" : new AgendaComponent()};

      beforeEach((){
        module((Module _) => _..bind(TestBed)..bind(AgendaItemComponent));
        return loadTemplates(['lib:components/agenda_item.html']);
      });

      it("defaults to the show mode", compileComponent(html(), scope(), (shadowRoot){
        expect(shadowRoot.query("input[type=agenda-item]")).toBeNull();
      }));

      it("switches to edit", compileComponent(html(), scope(), (shadowRoot) {
        final switchBtn = shadowRoot.query("button.switch-to-edit");

        switchBtn.click();

        digest();

        expect(shadowRoot.query("input[type=agenda-item]")).toBeDefined();
      }));

      it("switches to show", compileComponent(html(), scope(), (shadowRoot) {
        shadowRoot.query("button.switch-to-edit").click();

        digest();

        final cancelBtn = shadowRoot.query("button[type=reset]");
        cancelBtn.click();

        digest();

        expect(shadowRoot.query("input[type=agenda-item]")).toBeNull();
      }));
    });
  });
}
