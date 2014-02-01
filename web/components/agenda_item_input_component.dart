part of talk_to_me;

@NgComponent(
    selector: 'agenda-item-input',
    templateUrl: 'components/agenda_item_input.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class AgendaItemInputComponent {
  String description;

  @NgTwoWay("item")
  AgendaItem item;

  ParseAgendaItem parseAgendaItem;

  AgendaItemInputComponent(Scope scope, this.parseAgendaItem){

    //TODO delete it when ngModel supports custom converters
    description = "";
    scope.$watch(() => item, (_) {
      if (isEmptyItem(item)) {
        description = "";
      } else if (description == "") {
        description = "${item.description} !${item.priority}";
      }
    });
    rebuildNewItem();
  }

  void rebuildNewItem(){
    item = parseAgendaItem(description);
  }

  bool isEmptyItem(item) => item.description.isEmpty && item.priority == 3;

  bool get valid => item.valid;
}