part of talk_to_me;

class CallStorage {
  CallSerializer serializer;

  CallStorage(this.serializer);

  get all => _s.keys.fold([], (res, curr) => res..add(_fetch(curr)));

  store(Call call){
    var id = _getId(call);
    _s[id] = serializer.serialize(call, id);
    return id;
  }

  find(String id) => _s.containsKey(id) ? _fetch(id) : null;

  _getId(call) => call.id != null ? call.id  : new Uuid().v4();
  _fetch(id) => serializer.deserialize(_s[id]);
  get _s => html.window.localStorage;
}
