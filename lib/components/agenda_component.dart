part of talk_to_me.components;

@NgComponent(
    selector: 'agenda',
    templateUrl: 'packages/talk_to_me/components/agenda.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class AgendaComponent {
  @NgOneWayOneTime("checkable")
  bool checkable;
  AgendaItem newAgendaItem;

  @NgOneWay("model")
  List<AgendaItem> model;

  AgendaComponent(){
    newAgendaItem = new AgendaItem("", false, 3);
  }

  addItem(){
    model.add(newAgendaItem);
    newAgendaItem = new AgendaItem("", false, 3);
  }

  deleteItem(AgendaItem item){
    model.remove(item);
  }

  get valid => newAgendaItem.valid;
}