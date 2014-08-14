part of talk_to_me;

@Component(
    selector: 'create-call',
    publishAs: 'ctrl',
    templateUrl: 'lib/components/create_call.html',
    useShadowDom: false
)
class CreateCallComponent {
  Call call = new Call();
  CallStorage storage;
  Router router;

  CreateCallComponent(this.storage, this.router);

  void create() {
    var callId = storage.store(call);
    router.go("list.show", {"callId": callId});
  }
}
