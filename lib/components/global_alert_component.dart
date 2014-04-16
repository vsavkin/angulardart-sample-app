part of talk_to_me;

@NgComponent(
    selector: 'global-alert',
    templateUrl: 'lib:components/global_alert.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class GlobalAlertComponent {
  String message;

  GlobalAlertComponent(Scope scope) {
    scope.on("globalAlert").listen((ScopeEvent scopeEvent) {
      _showMessage(scopeEvent.data);
    });
  }

  void _showMessage(String message) {
    this.message = message;
  }
}