part of talk_to_me;

@Controller(
    selector: '[create-call-ctrl]',
    publishAs: 'ctrl'
)
class CreateCallCtrl {
  Call call = new Call();
  CallStorage storage;
  Router router;

  CreateCallCtrl(this.storage, this.router);

  void create() {
    var callId = storage.store(call);
    router.go("list.show", {"callId": callId});
  }
}
