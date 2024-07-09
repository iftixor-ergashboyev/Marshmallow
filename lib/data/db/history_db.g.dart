// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $HistoryDbBuilderContract {
  /// Adds migrations to the builder.
  $HistoryDbBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $HistoryDbBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<HistoryDb> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorHistoryDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $HistoryDbBuilderContract databaseBuilder(String name) =>
      _$HistoryDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $HistoryDbBuilderContract inMemoryDatabaseBuilder() =>
      _$HistoryDbBuilder(null);
}

class _$HistoryDbBuilder implements $HistoryDbBuilderContract {
  _$HistoryDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $HistoryDbBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $HistoryDbBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<HistoryDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$HistoryDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$HistoryDb extends HistoryDb {
  _$HistoryDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LoveDao? _loveDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Couple` (`id` INTEGER, `boy` TEXT NOT NULL, `girl` TEXT NOT NULL, `loveValue` INTEGER NOT NULL, `date` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LoveDao get loveDao {
    return _loveDaoInstance ??= _$LoveDao(database, changeListener);
  }
}

class _$LoveDao extends LoveDao {
  _$LoveDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _coupleInsertionAdapter = InsertionAdapter(
            database,
            'Couple',
            (Couple item) => <String, Object?>{
                  'id': item.id,
                  'boy': item.boy,
                  'girl': item.girl,
                  'loveValue': item.loveValue,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Couple> _coupleInsertionAdapter;

  @override
  Future<List<Couple>> getAllHistory() async {
    return _queryAdapter.queryList('SELECT * FROM Couple',
        mapper: (Map<String, Object?> row) => Couple(
            id: row['id'] as int?,
            boy: row['boy'] as String,
            girl: row['girl'] as String,
            loveValue: row['loveValue'] as int,
            date: row['date'] as String));
  }

  @override
  Future<void> clearHistory() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Couple');
  }

  @override
  Future<void> insertHistory(Couple couple) async {
    await _coupleInsertionAdapter.insert(couple, OnConflictStrategy.abort);
  }
}
