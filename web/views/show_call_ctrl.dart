part of talk_to_me;

@NgController(
    selector: "[show-call-ctrl]",
    publishAs: "ctrl"
)
class ShowCallCtrl {
  Call call;
  CallStorage storage;
  CallSerializer serializer;

  ShowCallCtrl(this.storage, this.serializer, Router router, Scope scope){
    call = storage.find(_confId(router));
    scope.$watch(_watchExp, _store);
  }

  _watchExp() => serializer.serialize(call, call.id);
  _store() => storage.store(call);

  _confId(router) => router.activePath.last.parameters["confId"];
}
