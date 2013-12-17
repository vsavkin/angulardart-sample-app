library talk_to_me_test;

import 'package:unittest/unittest.dart';
import 'package:dartmocks/dartmocks.dart';

import '../web/talk_to_me.dart';
import 'package:angular/routing/module.dart';

part 'unit/parse_agenda_item_test.dart';
part 'unit/agenda_item_test.dart';
part 'unit/create_call_ctrl_test.dart';

main(){
  testParseAgendaItem();
  testAgendaItem();
  testCreateCallCtrl();
}