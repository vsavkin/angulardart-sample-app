part of talk_to_me;

@NgController(
    selector: "[start-call-ctrl]",
    publishAs: "ctrl"
)
class StartCallCtrl {
  WebRtcServer server;
  String offer;
  String answer;

  StartCallCtrl(this.server){
    server.createOffer().then((_) => offer = _);
  }

  get canStartCall => answer.isNotEmpty;

  startCall(){
  }
}