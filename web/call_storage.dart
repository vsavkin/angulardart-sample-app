part of talk_to_me;

class CallStorage {
  CallSerializer serializer;

  CallStorage(this.serializer);

  store(Call call){
    var id = _getId(call);
    _s[id] = serializer.serialize(call, id);
    return id;
  }

  find(String id) => _s.containsKey(id) ? serializer.deserialize(_s[id]) : null;

  _getId(call) => call.id != null ? call.id  : new Uuid().v4();

  get _s => html.window.localStorage;
}
