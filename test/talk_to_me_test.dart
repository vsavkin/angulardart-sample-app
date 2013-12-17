library talk_to_me_test;

import 'package:unittest/unittest.dart';
import '../web/talk_to_me.dart';

part 'unit/parse_agenda_item_test.dart';
part 'unit/agenda_item_test.dart';

main(){
  testParseAgendaItem();
  testAgendaItem();
}