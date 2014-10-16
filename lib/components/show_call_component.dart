part of talk_to_me;

@Component(
    selector: "show-call",
    exportExpressions: const ['watchExp'],
    templateUrl: 'lib/components/show_call.html',
    useShadowDom: false
)
class ShowCallComponent implements ScopeAware {
  Call call;
  CallStorage storage;
  CallSerializer serializer;
  bool userIsOnline = false;

  ShowCallComponent(this.storage, this.serializer, RouteProvider routeProvider,
      UsersRepository repo){
    call = storage.find(_callId(routeProvider));
    _checkIfOnline(call.name, repo.all());
  }

  void set scope(Scope scope) {
    scope.watch("watchExp()", _store, context: this);
  }

  Future _checkIfOnline(String userName, Future<List<User>> users) {
    return users.then((_) {
      userIsOnline = _.any((u) => u.name == call.name && u.isOnline);
    });
  }

  String watchExp() => serializer.serialize(call, call.id);

  void _store(value, previousValue) {
    storage.store(call);
  }

  String _callId(routeProvider) => routeProvider.parameters["callId"];
}

