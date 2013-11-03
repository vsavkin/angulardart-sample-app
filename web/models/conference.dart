part of easy_conf;

class Conference {
  String id;
  String name;
  List<AgendaItem> agenda;

  Conference(){
    agenda = [
        new AgendaItem("desc 1", false),
        new AgendaItem("desc 2", true)
    ];
  }

  bool get valid => name.isNotEmpty;
}
