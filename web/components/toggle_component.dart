part of talk_to_me;

@NgComponent(
    selector: 'toggle',
    templateUrl: 'components/toggle.html',
    publishAs: 'ctrl',
    map: const {
      'open-label': '@openLabel',
      'close-label': '@closeLabel'
    }
)
class ToggleComponent {
  bool open = false;
  String openLabel;
  String closeLabel;

  toggle() => open = !open;
}