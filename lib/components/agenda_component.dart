part of talk_to_me;

@Component(
    selector: 'agenda',
    templateUrl: 'lib:components/agenda.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class AgendaComponent {
  @NgOneWayOneTime("checkable")
  bool checkable;
  AgendaItem newAgendaItem;

  @NgOneWay("model")
  List<AgendaItem> model;

  AgendaComponent() {
    newAgendaItem = new AgendaItem("", false, 3);
  }

  void addItem() {
    model.add(newAgendaItem);
    newAgendaItem = new AgendaItem("", false, 3);
  }

  void deleteItem(AgendaItem item) {
    model.remove(item);
  }

  bool get valid => newAgendaItem.valid;
}