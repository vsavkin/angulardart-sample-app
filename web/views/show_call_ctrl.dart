part of talk_to_me;

@NgController(
    selector: "[show-call-ctrl]",
    publishAs: "ctrl"
)
class ShowCallCtrl {
  Call call;
  CallStorage storage;
  CallSerializer serializer;
  bool userIsOnline = false;

  ShowCallCtrl(this.storage, this.serializer, RouteProvider routeProvider, Scope scope, UsersRepository repo){
    call = storage.find(_callId(routeProvider));
    _checkIfOnline(call.name, repo.all());

    scope.$watch(_watchExp, _store);
  }

  _checkIfOnline(String userName, Future<List<User>> users){
    users.then((_){
      userIsOnline = _.any((u) => u.name == call.name && u.isOnline);
    });
  }

  _watchExp() => serializer.serialize(call, call.id);
  _store() => storage.store(call);

  _callId(routeProvider) => routeProvider.parameters["callId"];
}

