library talk_to_me;

import 'dart:html' as html;
import 'dart:convert';
import 'dart:async';

@MirrorsUsed(targets: const ['talk_to_me'], override: '*')
import 'dart:mirrors';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart' show Uuid;

part 'services/call_serializer.dart';
part 'services/call_storage.dart';
part 'services/users_repository.dart';
part 'services/parse_agenda_item.dart';
part 'services/messages.dart';

part 'talk_to_me_route_initializer.dart';
part 'global_http_interceptors.dart';

part 'components/toggle_component.dart';
part 'components/call_component.dart';
part 'components/agenda_component.dart';
part 'components/agenda_item_component.dart';
part 'components/agenda_item_input_component.dart';
part 'components/global_alert_component.dart';
part 'models/call.dart';
part 'models/agenda_item.dart';
part 'models/user.dart';
part 'views/list_ctrl.dart';
part 'views/create_call_ctrl.dart';
part 'views/show_call_ctrl.dart';

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