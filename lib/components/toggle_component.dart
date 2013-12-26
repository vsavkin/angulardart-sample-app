part of talk_to_me.components;

@NgComponent(
    selector: 'toggle',
    templateUrl: 'packages/talk_to_me/components/toggle.html',
    publishAs: 'ctrl'
)
class ToggleComponent {
  @NgTwoWay("toggle-property")
  bool open = false;
}