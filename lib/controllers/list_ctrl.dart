part of talk_to_me;

@NgController(
    selector: '[list-ctrl]',
    publishAs: 'ctrl'
)
class ListCtrl {
  List<Call> calls;
  Router router;

  ListCtrl(CallStorage storage, this.router) {
    calls = storage.all;
  }

  bool isSelected(Call call) => _callId == call.id;
  bool get isAnySelected => _callId != null;

  String get _callId => router.activePath.last.parameters["callId"];
}