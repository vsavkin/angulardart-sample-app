part of talk_to_me;

@Component(
    selector: 'agenda-item',
    templateUrl: 'lib/components/agenda_item.html',
    useShadowDom: false,
    publishAs: 'ctrl'
)
class AgendaItemComponent {
  @NgOneWayOneTime("agenda")
  AgendaComponent agenda;

  @NgTwoWay("item")
  AgendaItem item;

  String mode = "show";
  AgendaItem editItem;

  bool get isShow => mode == "show";
  bool get isEdit => mode == "edit";

  switchToEdit() {
    editItem = item;
    mode = "edit";
  }

  void save() {
    item.description = editItem.description;
    item.priority = editItem.priority;

    mode = "show";
  }

  void delete() {
    agenda.deleteItem(item);
  }

  void cancel() {
    mode = "show";
  }

  bool get valid => editItem.valid;

  bool get checkable => agenda.checkable;
}