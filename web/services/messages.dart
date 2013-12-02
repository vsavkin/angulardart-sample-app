part of talk_to_me;

class Messages {
  Scope rootScope;

  Messages(Scope scope){
    rootScope = scope.$root;
  }

  alert(String message){
    rootScope.$broadcast("globalAlert", [message]);
  }
}