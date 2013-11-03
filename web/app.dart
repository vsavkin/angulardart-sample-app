library easy_conf;

import 'dart:html' as html;
import 'dart:json' as JSON;

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart' show Uuid;

part 'serializer.dart';
part 'storage.dart';
part 'easy_conf_route_initializer.dart';

part 'components/agenda_component.dart';
part 'models/conference.dart';
part 'models/agenda_item.dart';
part 'views/create_conf_ctrl.dart';
part 'views/show_conf_ctrl.dart';


class EasyConf extends Module {
  EasyConf(){
    type(CreateConfCtrl);
    type(ShowConfCtrl);
    type(AgendaItemComponent);
    type(AgendaComponent);
    type(Serializer);
    type(Storage);

    type(RouteInitializer, implementedBy: EasyConfRouteInitializer);
    factory(NgRoutingUsePushState, (_) => new NgRoutingUsePushState.value(false));
  }
}

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });

  ngBootstrap(module: new EasyConf());
}