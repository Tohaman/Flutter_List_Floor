// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorMainDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MainDatabaseBuilder databaseBuilder(String name) =>
      _$MainDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MainDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MainDatabaseBuilder(null);
}

class _$MainDatabaseBuilder {
  _$MainDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$MainDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MainDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MainDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$MainDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MainDatabase extends MainDatabase {
  _$MainDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MainDao _mainDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `main` (`id` INTEGER, `phase` TEXT, `title` TEXT, `icon` TEXT, `description` TEXT, `url` TEXT, `comment` TEXT, `isFavourite` INTEGER, `favComment` TEXT, `subId` INTEGER, PRIMARY KEY (`id`, `phase`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MainDao get mainDao {
    return _mainDaoInstance ??= _$MainDao(database, changeListener);
  }
}

class _$MainDao extends MainDao {
  _$MainDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _mainDBItemInsertionAdapter = InsertionAdapter(
            database,
            'main',
            (MainDBItem item) => <String, dynamic>{
                  'id': item.id,
                  'phase': item.phase,
                  'title': item.title,
                  'icon': item.icon,
                  'description': item.description,
                  'url': item.url,
                  'comment': item.comment,
                  'isFavourite': item.isFavourite == null
                      ? null
                      : (item.isFavourite ? 1 : 0),
                  'favComment': item.favComment,
                  'subId': item.subId
                }),
        _mainDBItemUpdateAdapter = UpdateAdapter(
            database,
            'main',
            ['id', 'phase'],
            (MainDBItem item) => <String, dynamic>{
                  'id': item.id,
                  'phase': item.phase,
                  'title': item.title,
                  'icon': item.icon,
                  'description': item.description,
                  'url': item.url,
                  'comment': item.comment,
                  'isFavourite': item.isFavourite == null
                      ? null
                      : (item.isFavourite ? 1 : 0),
                  'favComment': item.favComment,
                  'subId': item.subId
                }),
        _mainDBItemDeletionAdapter = DeletionAdapter(
            database,
            'main',
            ['id', 'phase'],
            (MainDBItem item) => <String, dynamic>{
                  'id': item.id,
                  'phase': item.phase,
                  'title': item.title,
                  'icon': item.icon,
                  'description': item.description,
                  'url': item.url,
                  'comment': item.comment,
                  'isFavourite': item.isFavourite == null
                      ? null
                      : (item.isFavourite ? 1 : 0),
                  'favComment': item.favComment,
                  'subId': item.subId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MainDBItem> _mainDBItemInsertionAdapter;

  final UpdateAdapter<MainDBItem> _mainDBItemUpdateAdapter;

  final DeletionAdapter<MainDBItem> _mainDBItemDeletionAdapter;

  @override
  Future<List<MainDBItem>> getAllItems() async {
    return _queryAdapter.queryList('select * from main',
        mapper: (Map<String, dynamic> row) => MainDBItem(
            id: row['id'] as int,
            phase: row['phase'] as String,
            title: row['title'] as String,
            icon: row['icon'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            comment: row['comment'] as String,
            isFavourite: row['isFavourite'] == null
                ? null
                : (row['isFavourite'] as int) != 0,
            favComment: row['favComment'] as String,
            subId: row['subId'] as int));
  }

  @override
  Future<List<MainDBItem>> getPhase(String phase) async {
    return _queryAdapter.queryList(
        'SELECT * FROM main WHERE phase = ? ORDER BY id',
        arguments: <dynamic>[phase],
        mapper: (Map<String, dynamic> row) => MainDBItem(
            id: row['id'] as int,
            phase: row['phase'] as String,
            title: row['title'] as String,
            icon: row['icon'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            comment: row['comment'] as String,
            isFavourite: row['isFavourite'] == null
                ? null
                : (row['isFavourite'] as int) != 0,
            favComment: row['favComment'] as String,
            subId: row['subId'] as int));
  }

  @override
  Future<int> insertItem(MainDBItem item) {
    return _mainDBItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(MainDBItem item) {
    return _mainDBItemUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(MainDBItem item) {
    return _mainDBItemDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteAllItems(List<MainDBItem> items) {
    return _mainDBItemDeletionAdapter.deleteListAndReturnChangedRows(items);
  }
}
