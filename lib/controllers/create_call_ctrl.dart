part of talk_to_me.controller;

@NgController(
    selector: '[create-call-ctrl]',
    publishAs: 'ctrl'
)
class CreateCallCtrl {
  Call call = new Call();
  CallStorage storage;
  Router router;

  CreateCallCtrl(this.storage, this.router);

  create(){
    var callId = storage.store(call);
    router.go("list.show", {"callId": callId});
  }
}