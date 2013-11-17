part of talk_to_me;

@NgComponent(
    selector: 'agenda-item-input',
    templateUrl: 'components/agenda_item_input.html',
    publishAs: 'ctrl',
    map: const {
      'item': '<=>item',
    }
)
class AgendaItemInputComponent {
  String description;
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