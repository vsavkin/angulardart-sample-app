library talk_to_me;

import 'dart:html' as html;
import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/animate/module.dart';
import 'package:angular/application_factory.dart';
import 'package:uuid/uuid_client.dart';

part 'services/call_serializer.dart';
part 'services/call_storage.dart';
part 'services/users_repository.dart';
part 'services/messages.dart';
part 'services/parse_agenda_item.dart';

part 'talk_to_me_route_initializer.dart';
part 'global_http_interceptors.dart';

part 'decorators/agenda_item_text_input.dart';
part 'decorators/toggle.dart';

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
    bind(ListCtrl);
    bind(CreateCallCtrl);
    bind(ShowCallCtrl);

    bind(AgendaItemTextInput);
    bind(AgendaItemComponent);
    bind(AgendaComponent);
    bind(CallComponent);
    bind(Toggle);

    bind(CallSerializer);
    bind(CallStorage);
    bind(UsersRepository);

    bind(Messages);
    bind(GlobalAlertComponent);

    bind(RouteInitializerFn, toValue: talkToMeRouteInitializer);
    bind(NgRoutingUsePushState, toFactory: (_) => new NgRoutingUsePushState.value(false));

    bind(UrlRewriter, toImplementation: TalkToMeUrlRewriter);

    install(new AnimationModule());
  }
}

class TalkToMeUrlRewriter implements UrlRewriter {
  String call(url) =>
  url.startsWith('lib:') ? 'packages/talk_to_me/${url.substring(4)}' : url;
}

startTalkToMeApp(){
  Injector inj = applicationFactory().addModule(new TalkToMeApp()).run();
  GlobalHttpInterceptors.setUp(inj);
}