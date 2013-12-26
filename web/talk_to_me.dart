library talk_to_me;

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:logging/logging.dart';

import 'package:talk_to_me/talk_to_me_route_initializer.dart';
import 'package:talk_to_me/services/services.dart';
import 'package:talk_to_me/controllers/controllers.dart';
import 'package:talk_to_me/components/components.dart';
import 'package:talk_to_me/global_http_interceptors.dart';

class TalkToMeApp extends Module {
  TalkToMeApp(){
    type(ListCtrl);
    type(CreateCallCtrl);
    type(ShowCallCtrl);

    type(AgendaItemInputComponent);
    type(AgendaItemComponent);
    type(AgendaComponent);
    type(CallComponent);
    type(ToggleComponent);

    type(ParseAgendaItem);
    type(CallSerializer);
    type(CallStorage);
    type(UsersRepository);

    type(Messages);
    type(GlobalAlertComponent);

    type(RouteInitializer, implementedBy: TalkToMeRouteInitializer);
    factory(NgRoutingUsePushState, (_) => new NgRoutingUsePushState.value(false));
  }
}

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });

  Injector inj = ngBootstrap(module: new TalkToMeApp());
  GlobalHttpInterceptors.setUp(inj);
}