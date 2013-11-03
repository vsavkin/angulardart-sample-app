part of easy_conf;

class Storage {
  Serializer serializer;

  Storage(this.serializer);

  store(Conference conf){
    var id = _getId(conf);
    _s[id] = serializer.serializeConf(conf, id);
    return id;
  }

  find(String id) => _s.containsKey(id) ? serializer.deserializeConf(_s[id]) : null;

  _getId(conf) => conf.id != null ? conf.id  : new Uuid().v4();

  get _s => html.window.localStorage;
}
