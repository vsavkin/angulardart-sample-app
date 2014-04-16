library talk_to_me;

import 'dart:html' as html;
import 'dart:async';
import 'dart:convert';

@MirrorsUsed(targets: const['talk_to_me'], override: '*')
import 'dart:mirrors';

import 'package:angular/angular.dart';
import 'package:angular/angular_dynamic.dart';
import 'package:angular/routing/module.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart' show Uuid;

part 'package:talk_to_me/services/call_serializer.dart';
part 'package:talk_to_me/services/call_storage.dart';
part 'package:talk_to_me/services/users_repository.dart';
part 'package:talk_to_me/services/parse_agenda_item.dart';
part 'package:talk_to_me/services/messages.dart';
part 'package:talk_to_me/talk_to_me_route_initializer.dart';
part 'package:talk_to_me/global_http_interceptors.dart';
part 'package:talk_to_me/components/toggle_component.dart';
part 'package:talk_to_me/components/call_component.dart';
part 'package:talk_to_me/components/agenda_component.dart';
part 'package:talk_to_me/components/agenda_item_component.dart';
part 'package:talk_to_me/components/agenda_item_input_component.dart';
part 'package:talk_to_me/components/global_alert_component.dart';
part 'package:talk_to_me/models/call.dart';
part 'package:talk_to_me/models/agenda_item.dart';
part 'package:talk_to_me/models/user.dart';
part 'package:talk_to_me/controllers/list_ctrl.dart';
part 'package:talk_to_me/controllers/create_call_ctrl.dart';
part 'package:talk_to_me/controllers/show_call_ctrl.dart';

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

    value(RouteInitializerFn, talkToMeRouteInitializer);
    factory(NgRoutingUsePushState, (_) => new NgRoutingUsePushState.value(false));

    type(UrlRewriter, implementedBy: TalkToMeUrlRewriter);
  }
}

class TalkToMeUrlRewriter implements UrlRewriter {
  String call(url) =>
      url.startsWith('lib:') ? 'packages/talk_to_me/${url.substring(4)}' : url;
}

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });

  Injector inj = ngDynamicApp().addModule(new TalkToMeApp()).run();
  GlobalHttpInterceptors.setUp(inj);
}