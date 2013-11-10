part of talk_to_me;

@NgController(
    selector: "[join-call-ctrl]",
    publishAs: "ctrl"
)
class JoinCallCtrl {
  WebRtcClient client;
  String offer;
  String answer;

  JoinCallCtrl(this.client);

  generateAnswer(){
    client.generateAnswer(offer).then((_) => answer = _);
  }
}