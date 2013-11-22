part of talk_to_me;

@NgComponent(
    selector: 'agenda',
    templateUrl: 'components/agenda.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class AgendaComponent {
  @NgOneWayOneTime("checkable")
  bool checkable;
  AgendaItem newAgendaItem;

  @NgTwoWay("model")
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

@NgComponent(
    selector: 'agenda-item',
    templateUrl: 'components/agenda_item.html',
    applyAuthorStyles: true,
    publishAs: 'ctrl'
)
class AgendaItemComponent {
  @NgOneWayOneTime("agenda")
  AgendaComponent agenda;

  @NgTwoWay("item")
  AgendaItem item;

  String mode = "show";
  AgendaItem editItem;

  get isShow => mode == "show";
  get isEdit => mode == "edit";

  switchToEdit(){
    editItem = item;
    mode = "edit";
  }

  save(){
    item.description = editItem.description;
    item.priority = editItem.priority;

    mode = "show";
  }

  delete() => agenda.deleteItem(item);
  cancel() => mode = "show";


  get valid => editItem.valid;

  get checkable => agenda.checkable;
}