part of talk_to_me;

@Injectable()
class Messages {
  RootScope rootScope;

  Messages(this.rootScope);

  void alert(String message){
    rootScope.broadcast("globalAlert", message);
  }
}