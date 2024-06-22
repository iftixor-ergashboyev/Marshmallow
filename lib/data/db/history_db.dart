import 'dart:async';

import 'package:floor/floor.dart';
import 'package:marshmallow/data/db/love_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../domain/model/couple.dart';

part 'history_db.g.dart';

@Database(version: 1, entities: [Couple])
abstract class HistoryDb extends FloorDatabase {
  LoveDao get loveDao;
}