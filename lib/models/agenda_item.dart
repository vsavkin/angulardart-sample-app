part of talk_to_me;

class AgendaItem {
  String description;
  bool done;
  num priority;

  AgendaItem(this.description, this.done, this.priority);

  num get extPriority => done ? 4 : priority;

  bool get valid => description.isNotEmpty && priority != null;
  bool get isNew => description.isEmpty && priority == 3;

  operator == (AgendaItem a) => description == a.description && done == a.done && priority == a.priority;
}
