library talk_to_me_test;

import 'package:unittest/unittest.dart';
import 'package:dartmocks/dartmocks.dart';
import 'dart:async';
import 'dart:html' as html;

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/mock/module.dart';

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

part 'unit/parse_agenda_item_test.dart';
part 'unit/agenda_item_test.dart';
part 'unit/create_call_ctrl_test.dart';
part 'unit/users_repository_test.dart';
part 'unit/agenda_item_component_test.dart';

main(){
  testParseAgendaItem();
  testAgendaItem();
  testCreateCallCtrl();
  testUsersRepository();
  testAgendaItemComponent();
}