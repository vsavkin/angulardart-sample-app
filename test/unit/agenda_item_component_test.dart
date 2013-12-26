part of talk_to_me_test;

loadTemplates(List<String> templates){
  updateCache(template, response) => inject((TemplateCache cache) => cache.put(template, response));

  final futures = templates.map((template) =>
    html.HttpRequest.request("${template}", method: "GET").
    then((_) => updateCache(template, new HttpResponse(200, _.response))));

  return Future.wait(futures);
}

compileComponent(String html, Map scope, callback){
  inject((TestBed tb) {
    final s = tb.rootScope.$new();
    scope.forEach((k,v) => s[k] = v);

    final el = tb.compile(html);

    Timer.run(expectAsync0(() {
      tb.rootScope.$digest();
      callback(el.shadowRoot);
    }));
  });
}

testAgendaItemComponent(){;
  group("[AgendaItemComponent]", () {
    setUp(setUpInjector);
    tearDown(tearDownInjector);

    group("[swiching between modes]", () {
      html() => '<agenda-item item="item" agenda="agenda"></agenda-item>';
      scope() => {"item" : new AgendaItem("description", true, 1), "agenda" : new AgendaComponent()};

      setUp((){
        module((Module _) => _..type(TestBed)..type(AgendaItemComponent));
        return loadTemplates(['packages/talk_to_me/components/agenda_item.html']);
      });

      test("defaults to the show mode", (){
        compileComponent(html(), scope(), (shadowRoot){
          expect(shadowRoot.query("agenda-item-input"), isNull);
        });
      });

      test("switches to edit", (){
        compileComponent(html(), scope(), (shadowRoot){
          final switchBtn = shadowRoot.query("button.switch-to-edit");

          switchBtn.click();

          expect(shadowRoot.query("agenda-item-input"), isNotNull);
        });
      });

      test("switches to show", (){
        compileComponent(html(), scope(), (shadowRoot){
          shadowRoot.query("button.switch-to-edit").click();

          final cancelBtn = shadowRoot.query("button[type=reset]");

          cancelBtn.click();

          expect(shadowRoot.query("agenda-item-input"), isNull);
        });
      });
    });
  });
}
