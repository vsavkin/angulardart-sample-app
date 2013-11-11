part of talk_to_me;

class CallSerializer {
  String serialize(Call call, String id){
    var map = {
        "id" : id,
        "name": call.name,
        "agenda" : call.agenda.map(_serializeItem).toList()
    };
    return JSON.encode(map);
  }

  Call deserialize(String str){
    var json = JSON.decode(str);
    return new Call()
      ..id = json["id"]
      ..name = json["name"]
      ..agenda = json["agenda"].map(_deserializeItem).toList();
  }

  _serializeItem(_) => {"description": _.description, "done": _.done, "priority" : _.priority};

  _deserializeItem(_) => new AgendaItem(_["description"], _["done"], _["priority"]);
}
