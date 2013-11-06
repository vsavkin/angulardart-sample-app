part of talk_to_me;

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
    var confId = storage.store(call);
    router.go("show", {"confId": confId});
  }
}