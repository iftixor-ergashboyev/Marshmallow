import 'package:floor/floor.dart';
import 'package:marshmallow/domain/model/couple.dart';
@dao
abstract class LoveDao {
  @Query('SELECT * FROM Couple')
  Future<List<Couple>> getAllHistory();

  @Insert()
  Future<void> insertHistory(Couple couple);

  @Query("DELETE FROM Couple")
  Future<void> clearHistory();
}