part of talk_to_me;

@Component(
    selector: 'toggle',
    templateUrl: 'lib:components/toggle.html',
    publishAs: 'ctrl'
)
class ToggleComponent {
  @NgTwoWay("toggle-property")
  bool open = false;
}