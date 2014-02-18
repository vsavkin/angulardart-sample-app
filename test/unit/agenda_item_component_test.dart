part of talk_to_me_test;

loadTemplates(List<String> templates){
  updateCache(template, response) => inject((TemplateCache cache) => cache.put(template, response));

  final futures = templates.map((template) =>
    html.HttpRequest.request('packages/talk_to_me/' + template.substring(4), method: "GET").
    then((_) => updateCache(template, new HttpResponse(200, _.response))));

  return Future.wait(futures);
}

compileComponent(String html, Map scope, callback){
  inject((TestBed tb) {
    final s = tb.rootScope.$new();
    scope.forEach((k,v) => s[k] = v);

    final el = tb.compile(html, scope: s);

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
        return loadTemplates(['lib:components/agenda_item.html']);
      });

      test("defaults to the show mode", (){
        compileComponent(html(), scope(), (shadowRoot){
          expect(shadowRoot.query("input[type=agenda-item]"), isNull);
        });
      });

      test("switches to edit", (){
        compileComponent(html(), scope(), (shadowRoot){
          final switchBtn = shadowRoot.query("button.switch-to-edit");

          switchBtn.click();

          expect(shadowRoot.query("input[type=agenda-item]"), isNotNull);
        });
      });

      test("switches to show", (){
        compileComponent(html(), scope(), (shadowRoot){
          shadowRoot.query("button.switch-to-edit").click();

          final cancelBtn = shadowRoot.query("button[type=reset]");

          cancelBtn.click();

          expect(shadowRoot.query("input[type=agenda-item]"), isNull);
        });
      });
    });
  });
}
