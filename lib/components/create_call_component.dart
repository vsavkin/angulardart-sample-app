part of talk_to_me;

@Component(
    selector: 'create-call',
    templateUrl: 'lib/components/create_call.html',
    useShadowDom: false
)
class CreateCallComponent {
  Call call = new Call();
  CallStorage storage;
  Router router;
  NgForm createForm;

  CreateCallComponent(this.storage, this.router);

  void create() {
    var callId = storage.store(call);
    router.go("list.show", {"callId": callId});
  }
}
