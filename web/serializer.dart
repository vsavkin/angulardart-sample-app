part of easy_conf;

class Serializer {
  String serializeConf(Conference conf, String id){
    var map = {
        "id" : id,
        "name": conf.name,
        "agenda" : conf.agenda.map(_serializeItem).toList()
    };
    return JSON.stringify(map);
  }

  Conference deserializeConf(String str){
    var json = JSON.parse(str);
    return new Conference()
      ..id = json["id"]
      ..name = json["name"]
      ..agenda = json["agenda"].map(_deserializeItem).toList();
  }

  _serializeItem(_) => {"description": _.description, "done": _.done};

  _deserializeItem(_) => new AgendaItem(_["description"], _["done"]);
}
