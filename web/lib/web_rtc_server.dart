part of talk_to_me;

class WebRtcServer {
  html.RtcPeerConnection peerConn;
  final mediaConstraints = {"mandatory" : {"OfferToReceiveAudio" : true, "OfferToReceiveVideo" : true}};

  WebRtcServer(){
    peerConn = new html.RtcPeerConnection({"iceServers": [{"url": "stun:stun.l.google.com:19302"}]});
  }

  Future<String> createOffer() =>
    peerConn.createOffer(mediaConstraints).then((rsd) =>
      JSON.encode({"type" : rsd.type, "sdp" : rsd.sdp}));
}