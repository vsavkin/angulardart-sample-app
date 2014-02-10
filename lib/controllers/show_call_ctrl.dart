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

  ShowCallCtrl(this.storage, this.serializer, RouteProvider routeProvider,
      Scope scope, UsersRepository repo){
    call = storage.find(_callId(routeProvider));
    _checkIfOnline(call.name, repo.all());
    scope.$watch(_watchExp, _store);
  }

  Future _checkIfOnline(String userName, Future<List<User>> users) {
    return users.then((_) {
      userIsOnline = _.any((u) => u.name == call.name && u.isOnline);
    });
  }

  String _watchExp() => serializer.serialize(call, call.id);

  void _store() => storage.store(call);

  String _callId(routeProvider) => routeProvider.parameters["callId"];
}

