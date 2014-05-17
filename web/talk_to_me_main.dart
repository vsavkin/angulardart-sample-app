library talk_to_me_main;

import 'package:angular/application_factory.dart';

import 'package:logging/logging.dart';
import 'package:talk_to_me/talk_to_me.dart';

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });

  final inj = applicationFactory().addModule(new TalkToMeApp()).run();
  GlobalHttpInterceptors.setUp(inj);
}