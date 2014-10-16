part of talk_to_me;

@Component(
    selector: 'global-alert',
    templateUrl: 'lib/components/global_alert.html',
    useShadowDom: false
)
class GlobalAlertComponent implements ScopeAware {
  String message;

  void set scope(Scope scope) {
    scope.on("globalAlert").listen(this._showMessage);
  }

  void _showMessage(ScopeEvent event) {
    this.message = event.data;
  }
}