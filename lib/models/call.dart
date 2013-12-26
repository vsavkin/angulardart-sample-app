part of talk_to_me.models;

class Call {
  String id;
  String name = "";
  List<AgendaItem> agenda = [];

  bool get valid => name.isNotEmpty;
}
