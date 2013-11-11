library talk_to_me;

import 'dart:html' as html;
import 'dart:convert';
import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart' show Uuid;

part 'call_serializer.dart';
part 'call_storage.dart';
part 'parse_agenda_item.dart';
part 'app_route_initializer.dart';

part 'components/toggle_component.dart';
part 'components/agenda_component.dart';
part 'components/agenda_item_input_component.dart';
part 'models/call.dart';
part 'models/agenda_item.dart';
part 'views/create_call_ctrl.dart';
part 'views/show_call_ctrl.dart';


class TalkToMeApp extends Module {
  TalkToMeApp(){
    type(CreateCallCtrl);
    type(ShowCallCtrl);

    type(AgendaItemInputComponent);
    type(AgendaItemComponent);
    type(AgendaComponent);
    type(ToggleComponent);

    type(ParseAgendaItem);
    type(CallSerializer);
    type(CallStorage);

    type(RouteInitializer, implementedBy: AppRouteInitializer);
    factory(NgRoutingUsePushState, (_) => new NgRoutingUsePushState.value(false));
  }
}

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });

  ngBootstrap(module: new TalkToMeApp());
}