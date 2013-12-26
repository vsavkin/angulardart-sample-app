library talk_to_me.services;

import 'dart:async';
import 'dart:html' as html;
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:talk_to_me/models/models.dart';
import 'package:uuid/uuid.dart';

part 'call_serializer.dart';
part 'call_storage.dart';
part 'messages.dart';
part 'parse_agenda_item.dart';
part 'users_repository.dart';