part of talk_to_me;

@NgController(
    selector: '[list-ctrl]',
    publishAs: 'ctrl'
)
class ListCtrl {
  List<Call> calls;
  Router router;

  ListCtrl(CallStorage storage, this.router){
    calls = storage.all;
  }

  isSelected(Call call) => _callId == call.id;
  get isAnySelected => _callId != null;

  get _callId => router.activePath.last.parameters["callId"];
}