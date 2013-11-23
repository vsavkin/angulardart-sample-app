part of talk_to_me;

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