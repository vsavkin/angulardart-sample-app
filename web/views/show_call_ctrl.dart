part of talk_to_me;

@NgController(
    selector: "[show-call-ctrl]",
    publishAs: "ctrl"
)
class ShowCallCtrl {
  Call call;
  CallStorage storage;
  CallSerializer serializer;

  ShowCallCtrl(this.storage, this.serializer, RouteProvider routeProvider, Scope scope){
    call = storage.find(_callId(routeProvider));
    scope.$watch(_watchExp, _store);
  }

  _watchExp() => serializer.serialize(call, call.id);
  _store() => storage.store(call);

  _callId(routeProvider) => routeProvider.parameters["callId"];
}

