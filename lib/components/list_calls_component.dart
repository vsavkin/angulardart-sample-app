part of talk_to_me;

@Component(
    selector: 'list',
    templateUrl: 'lib/components/list_calls.html',
    useShadowDom: false
)
class ListCallsComponent {
  List<Call> calls;
  Router router;

  ListCallsComponent(CallStorage storage, this.router) {
    calls = storage.all;
  }

  bool isSelected(Call call) => _callId == call.id;
  bool get isAnySelected => _callId != null;

  String get _callId => router.activePath.last.parameters["callId"];
}