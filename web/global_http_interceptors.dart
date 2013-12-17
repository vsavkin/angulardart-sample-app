part of talk_to_me;

class GlobalHttpInterceptors {
  static setUp(Injector inj) =>
    new GlobalHttpInterceptors(inj)..addGlobalAlertInterceptor();

  Injector inj;
  GlobalHttpInterceptors(this.inj);

  addGlobalAlertInterceptor() =>
    inj.get(HttpInterceptors)..add(_buildGlobalAlertInterceptor());

  _buildGlobalAlertInterceptor() =>
    new HttpInterceptor()
      ..responseError = (error) {
        final messages = inj.get(Messages);
        messages.alert(_globalAlertMessage());

        return new Future.error(error);
      };

  _globalAlertMessage(){
    final loc = inj.get(LocationWrapper);
    return "Something went wrong! <a href='${loc.location.pathname}'>Go to the main page.</a>";
  }
}