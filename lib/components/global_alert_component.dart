part of talk_to_me.components;

@NgComponent(
    selector: 'global-alert',
    templateUrl: 'lib:components/global_alert.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class GlobalAlertComponent {
  String message;

  GlobalAlertComponent(Scope scope){
    scope.$on("globalAlert", this._showMessage);
  }

  _showMessage(_, String message) => this.message = message;
}