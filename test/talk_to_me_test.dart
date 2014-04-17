library talk_to_me_test;

import 'package:unittest/unittest.dart';
import 'package:dartmocks/dartmocks.dart';
import 'dart:async';
import 'dart:html' as html;

import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:angular/mock/test_injection.dart';

import 'package:talk_to_me/talk_to_me.dart';

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