part of talk_to_me;

class AgendaItem {
  String description;
  bool done;
  num priority;

  AgendaItem(this.description, this.done, this.priority);

  bool get valid => description.isNotEmpty && priority != null;
}
