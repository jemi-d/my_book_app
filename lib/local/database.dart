
import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName('FavoriteBook')
class FavoriteBooks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get coverId => integer()();
  IntColumn get editionCount => integer()();
  IntColumn get firstPublicationYear => integer()();
  TextColumn get bookKey => text()(); // Unique ID or API key
  TextColumn get title => text()();
  TextColumn get author => text()();
  IntColumn get isFav => integer()();
  TextColumn get subjects => text().map(const StringListConverter())();
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return List<String>.from(jsonDecode(fromDb));
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

@DriftDatabase(tables: [FavoriteBooks])
class AppDatabase extends _$AppDatabase {

  // Singleton instance
  static AppDatabase? _instance;
  AppDatabase._internal() : super(_openConnection());

  // Singleton getter
  static AppDatabase getInstance() {
    _instance ??= AppDatabase._internal();
    return _instance!;
  }

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteBook>> getAllFavorites() => select(favoriteBooks).get();

  Stream<List<FavoriteBook>> watchAllFavorites() => select(favoriteBooks).watch();

  Future<void> addFavorite(FavoriteBooksCompanion book) => into(favoriteBooks).insert(book);

  Future<void> removeFavorite(String bookId) =>
      (delete(favoriteBooks)..where((tbl) => tbl.bookKey.equals(bookId))).go();

  Future<bool> isFavorite(String bookId) async {
    final result = await (select(favoriteBooks)
      ..where((tbl) => tbl.bookKey.equals(bookId)))
        .getSingleOrNull();
    return result != null;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'favorites.sqlite'));
    return NativeDatabase(file);
  });
}


