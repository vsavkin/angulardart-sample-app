part of talk_to_me.components;

@NgComponent(
    selector: 'agenda-item-input',
    templateUrl: 'packages/talk_to_me/components/agenda_item_input.html',
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
    scope.$watch(() => item, (_){
      if(isEmptyItem(item)){
        description = "";
      } else if (description == ""){
        description = "${item.description} !${item.priority}";
      }
    });
    rebuildNewItem();
  }

  rebuildNewItem(){
    item = parseAgendaItem(description);
  }

  isEmptyItem(item) => item.description.isEmpty && item.priority == 3;

  get valid => item.valid;
}