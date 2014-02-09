part of talk_to_me;

class CallStorage {
  CallSerializer serializer;

  CallStorage(this.serializer);

  List get all => _s.keys
      .where((k) => k.startsWith('talk-to-me:'))
      .map(_fetch).toList();

  String store(Call call){
    var id = _getId(call);
    _s[id] = serializer.serialize(call, id);
    return id;
  }

  find(String id) => _s.containsKey(id) ? _fetch(id) : null;

  String _getId(call) => call.id != null ? call.id  : 'talk-to-me:${new Uuid().v4()}';

  _fetch(id) => serializer.deserialize(_s[id]);

  html.Storage get _s => html.window.localStorage;
}
