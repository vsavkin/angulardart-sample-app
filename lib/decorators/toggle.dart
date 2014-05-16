part of talk_to_me;

@Decorator(selector: 'toggle')
class Toggle implements AttachAware {
  @NgTwoWay("toggle-property")
  bool open = false;

  html.Element el;
  Scope scope;

  Toggle(this.el, this.scope);

  void attach() {
    final whenOpen = el.querySelector("when-open");
    final whenClosed = el.querySelector("when-closed");

    whenOpen.hidden = true;
    whenClosed.hidden = true;

    scope.watch("ctrl.open", (newValue, _) {
      if(newValue) {
        whenOpen.hidden = false;
        whenClosed.hidden = true;
      } else {
        whenOpen.hidden = true;
        whenClosed.hidden = false;
      }
    });
  }
}