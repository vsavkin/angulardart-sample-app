library talk_to_me;

import 'dart:html' as html;
import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/animate/module.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid_client.dart';

part 'services/call_serializer.dart';
part 'services/call_storage.dart';
part 'services/users_repository.dart';
part 'services/messages.dart';
part 'services/parse_agenda_item.dart';

part 'talk_to_me_route_initializer.dart';
part 'global_http_interceptors.dart';

part 'directives/agenda_item_text_input.dart';

part 'components/toggle_component.dart';
part 'components/call_component.dart';
part 'components/agenda_component.dart';
part 'components/agenda_item_component.dart';
part 'components/global_alert_component.dart';

part 'controllers/list_ctrl.dart';
part 'controllers/create_call_ctrl.dart';
part 'controllers/show_call_ctrl.dart';

part 'models/call.dart';
part 'models/agenda_item.dart';
part 'models/user.dart';

class TalkToMeApp extends Module {
  TalkToMeApp(){
    type(ListCtrl);
    type(CreateCallCtrl);
    type(ShowCallCtrl);

    type(AgendaItemTextInput);
    type(AgendaItemComponent);
    type(AgendaComponent);
    type(CallComponent);
    type(ToggleComponent);

    type(CallSerializer);
    type(CallStorage);
    type(UsersRepository);

    type(Messages);
    type(GlobalAlertComponent);

    type(RouteInitializer, implementedBy: TalkToMeRouteInitializer);
    factory(NgRoutingUsePushState, (_) => new NgRoutingUsePushState.value(false));

    type(UrlRewriter, implementedBy: TalkToMeUrlRewriter);
    install(new NgAnimateModule());
  }
}

class TalkToMeUrlRewriter implements UrlRewriter {
  String call(url) =>
  url.startsWith('lib:') ? 'packages/talk_to_me/${url.substring(4)}' : url;
}

startTalkToMeApp(){
  Injector inj = ngBootstrap(module: new TalkToMeApp());
  GlobalHttpInterceptors.setUp(inj);
}