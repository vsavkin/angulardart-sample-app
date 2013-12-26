part of talk_to_me.components;

@NgComponent(
    selector: 'call',
    templateUrl: 'packages/talk_to_me/components/call.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class CallComponent implements NgAttachAware {
  Object videoSrc;

  @NgOneWay("is-online")
  bool isOnline;

  @NgOneWay("model")
  Call model;

  bool open = false;

  attach(){
    html.window.navigator.getUserMedia(video:true, audio: true).then((localStream) {
      videoSrc = html.Url.createObjectUrl(localStream);
    });
  }
}