library talk_to_me_main;

@MirrorsUsed(targets: const['talk_to_me'], override: '*')
import 'dart:mirrors';
import 'package:logging/logging.dart';
import 'package:talk_to_me/talk_to_me.dart';

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  startTalkToMeApp();
}