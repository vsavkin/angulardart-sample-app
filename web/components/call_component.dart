part of talk_to_me;

@NgComponent(
    selector: 'call',
    templateUrl: 'components/call.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true
)
class CallComponent implements NgAttachAware {
  Object videoSrc;

  attach(){
    html.window.navigator.getUserMedia(video:true, audio: true).then((localStream) {
      videoSrc = html.Url.createObjectUrl(localStream);
    });
  }
}