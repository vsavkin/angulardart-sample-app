part of talk_to_me;

@Component(
    selector: 'call',
    templateUrl: 'lib:components/call.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class CallComponent implements AttachAware {
  Object videoSrc;

  @NgOneWay("is-online")
  bool isOnline;

  @NgOneWay("model")
  Call model;

  bool open = false;

  Future attach() {
    return html.window.navigator.getUserMedia(video:true, audio: true)
        .then((localStream) {
          videoSrc = html.Url.createObjectUrl(localStream);
        });
  }
}