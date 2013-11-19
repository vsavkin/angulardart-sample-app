part of talk_to_me;

@NgComponent(
    selector: 'toggle',
    templateUrl: 'components/toggle.html',
    publishAs: 'ctrl'
)
class ToggleComponent {
  bool open = false;

  @NgAttr("openLabel")
  String openLabel;

  @NgAttr("closeLabel")
  String closeLabel;

  toggle() => open = !open;
}