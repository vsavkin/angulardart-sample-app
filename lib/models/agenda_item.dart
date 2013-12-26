part of talk_to_me.models;

class AgendaItem {
  String description;
  bool done;
  num priority;

  AgendaItem(this.description, this.done, this.priority);

  bool get valid => description.isNotEmpty && priority != null;

  num get extPriority => done ? 4 : priority;
}
