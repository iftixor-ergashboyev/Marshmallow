

import 'package:floor/floor.dart';

@entity
class Couple {
  @primaryKey
  final int? id;

  final String boy;
  final String girl;
  final int loveValue;
  final String date;

  Couple({
    required this.id,
    required this.boy,
    required this.girl,
    required this.loveValue,
    required this.date
  });
}