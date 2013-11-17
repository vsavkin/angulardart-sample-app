part of talk_to_me;

@NgController(
    selector: '[welcome-ctrl]',
    publishAs: 'ctrl'
)
class WelcomeCtrl {
  Router router;
  List<Call> calls;

  WelcomeCtrl(CallStorage storage, this.router){
    calls = storage.all;
  }
}