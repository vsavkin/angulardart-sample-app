part of easy_conf;

@NgController(
    selector: "[show-conf-ctrl]",
    publishAs: "ctrl"
)
class ShowConfCtrl {
  Conference conf;
  Storage storage;
  Serializer serializer;

  ShowConfCtrl(this.storage, this.serializer, Router router, Scope scope){
    conf = storage.find(_confId(router));
    scope.$watch(_watchExp, _store);
  }

  _watchExp() => serializer.serializeConf(conf, conf.id);
  _store() => storage.store(conf);

  _confId(router) => router.activePath[0].parameters["confId"];
}
