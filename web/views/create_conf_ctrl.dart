part of easy_conf;

@NgController(
    selector: '[create-conf-ctrl]',
    publishAs: 'ctrl'
)
class CreateConfCtrl {
  Conference conf = new Conference();
  Storage storage;
  Router router;

  CreateConfCtrl(this.storage, this.router);

  create(){
    var confId = storage.store(conf);
    router.go("show", {"confId": confId});
  }
}