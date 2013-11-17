part of talk_to_me;

@NgController(
    selector: '[list-ctrl]',
    publishAs: 'ctrl'
)
class ListCtrl {
  Router router;
  List<Call> calls;

  ListCtrl(CallStorage storage, this.router){
    calls = storage.all;
  }
}