part of talk_to_me;

class Messages {
  Scope rootScope;

  Messages(Scope scope) : rootScope = scope.rootScope;

  void alert(String message){
    rootScope.broadcast("globalAlert", [message]);
  }
}