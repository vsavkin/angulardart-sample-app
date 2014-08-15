part of talk_to_me;

@Component(
    selector: 'global-alert',
    templateUrl: 'lib/components/global_alert.html',
    publishAs: 'ctrl',
    useShadowDom: false
)
class GlobalAlertComponent {
  String message;

  GlobalAlertComponent(Scope scope) {
    scope.on("globalAlert").listen(this._showMessage);
  }

  void _showMessage(ScopeEvent event) {
    this.message = event.data;
  }
}