part of talk_to_me;

@NgComponent(
    selector: 'agenda',
    templateUrl: 'components/agenda.html',
    publishAs: 'ctrl',
    map: const {
        'model': '<=>model',
        'checkable': '=>!checkable'
    }
)
class AgendaComponent {
  bool checkable;
  String newAgendaDescription = "";
  List<AgendaItem> model;

  addItem(){
    model.add(new AgendaItem(newAgendaDescription, false));
    newAgendaDescription = "";
  }

  deleteItem(AgendaItem item){
    model.remove(item);
  }

  get valid => newAgendaDescription.isNotEmpty;
}

@NgComponent(
    selector: 'agenda-item',
    templateUrl: 'components/agenda_item.html',
    cssUrl: 'components/css/agenda_item.css',
    publishAs: 'ctrl',
    map: const {
        'item': '<=>item',
        'agenda': '=>!agenda'
    }
)
class AgendaItemComponent {
  AgendaComponent agenda;
  AgendaItem item;

  String mode = "show";
  String editDescription;

  get isShow => mode == "show";
  get isEdit => mode == "edit";

  switchToEdit(){
    editDescription = item.description;
    mode = "edit";
  }

  save(){
    item.description = editDescription;
    mode = "show";
  }

  delete(){
    agenda.deleteItem(item);
  }

  cancel(){
    mode = "show";
  }

  submit(){
    print("submit");
  }

  get valid => editDescription.isNotEmpty;

  get checkable => agenda.checkable;
}