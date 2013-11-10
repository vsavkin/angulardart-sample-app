part of talk_to_me;

class WebRtcClient {
  html.RtcPeerConnection peerConn;
  final mediaConstraints = {"mandatory" : {"OfferToReceiveAudio" : true, "OfferToReceiveVideo" : true}};

  WebRtcClient(){
    peerConn = new html.RtcPeerConnection({"iceServers": [{"url": "stun:stun.l.google.com:19302"}]});
  }

  Future<String> generateAnswer(String offer){
    var desc = new html.RtcSessionDescription(JSON.decode(offer));
    return peerConn.setRemoteDescription(desc).then((_) =>
      peerConn.createAnswer(mediaConstraints).then((rsd){
        peerConn.setLocalDescription(rsd);
        return JSON.encode({"type" : rsd.type, "sdp" : rsd.sdp});
      }));
  }
}