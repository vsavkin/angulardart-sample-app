part of talk_to_me;

@Decorator(selector: 'input[type=agenda-item][ng-model]')
class AgendaItemTextInput {
  ParseAgendaItem parseAgendaItem;
  Scope scope;

  html.InputElement element;
  NgModel model;

  AgendaItemTextInput(this.scope, this.model, html.Element element){
    this.parseAgendaItem  = new ParseAgendaItem();
    this.element = element;

    model.render = _modelToView;
    element.onKeyUp.listen(_viewToModel);
  }

  _modelToView(item){
    if(item.isNew){
      element.value = "";
    } else if (element.value.isEmpty){
      element.value = "${item.description} !${item.priority}";
    }
  }

  _viewToModel(_){
    var newItem = parseAgendaItem(element.value);
    if (model.viewValue != newItem)
      model.viewValue = newItem;
  }
}
