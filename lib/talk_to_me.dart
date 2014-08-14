library talk_to_me;

import 'dart:html' as html;
import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/animate/module.dart';
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

part 'components/list_calls_component.dart';
part 'components/create_call_component.dart';
part 'components/show_call_component.dart';

part 'models/call.dart';
part 'models/agenda_item.dart';
part 'models/user.dart';

class TalkToMeApp extends Module {
  TalkToMeApp(){
    bind(ListCallsComponent);
    bind(ShowCallComponent);
    bind(CreateCallComponent);

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
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

    bind(UrlRewriter, toImplementation: TalkToMeUrlRewriter);

    install(new AnimationModule());
  }
}

@Injectable()
class TalkToMeUrlRewriter implements UrlRewriter {
  String call(url) =>
  url.startsWith('lib:') ? 'packages/talk_to_me/${url.substring(4)}' : url;
}