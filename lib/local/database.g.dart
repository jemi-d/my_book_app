// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteBooksTable extends FavoriteBooks
    with TableInfo<$FavoriteBooksTable, FavoriteBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteBooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _coverIdMeta = const VerificationMeta(
    'coverId',
  );
  @override
  late final GeneratedColumn<int> coverId = GeneratedColumn<int>(
    'cover_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _editionCountMeta = const VerificationMeta(
    'editionCount',
  );
  @override
  late final GeneratedColumn<int> editionCount = GeneratedColumn<int>(
    'edition_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstPublicationYearMeta =
      const VerificationMeta('firstPublicationYear');
  @override
  late final GeneratedColumn<int> firstPublicationYear = GeneratedColumn<int>(
    'first_publication_year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bookKeyMeta = const VerificationMeta(
    'bookKey',
  );
  @override
  late final GeneratedColumn<String> bookKey = GeneratedColumn<String>(
    'book_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavMeta = const VerificationMeta('isFav');
  @override
  late final GeneratedColumn<int> isFav = GeneratedColumn<int>(
    'is_fav',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> subjects =
      GeneratedColumn<String>(
        'subjects',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($FavoriteBooksTable.$convertersubjects);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    coverId,
    editionCount,
    firstPublicationYear,
    bookKey,
    title,
    author,
    isFav,
    subjects,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_books';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteBook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cover_id')) {
      context.handle(
        _coverIdMeta,
        coverId.isAcceptableOrUnknown(data['cover_id']!, _coverIdMeta),
      );
    } else if (isInserting) {
      context.missing(_coverIdMeta);
    }
    if (data.containsKey('edition_count')) {
      context.handle(
        _editionCountMeta,
        editionCount.isAcceptableOrUnknown(
          data['edition_count']!,
          _editionCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_editionCountMeta);
    }
    if (data.containsKey('first_publication_year')) {
      context.handle(
        _firstPublicationYearMeta,
        firstPublicationYear.isAcceptableOrUnknown(
          data['first_publication_year']!,
          _firstPublicationYearMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstPublicationYearMeta);
    }
    if (data.containsKey('book_key')) {
      context.handle(
        _bookKeyMeta,
        bookKey.isAcceptableOrUnknown(data['book_key']!, _bookKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_bookKeyMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('is_fav')) {
      context.handle(
        _isFavMeta,
        isFav.isAcceptableOrUnknown(data['is_fav']!, _isFavMeta),
      );
    } else if (isInserting) {
      context.missing(_isFavMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteBook(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      coverId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}cover_id'],
          )!,
      editionCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}edition_count'],
          )!,
      firstPublicationYear:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}first_publication_year'],
          )!,
      bookKey:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}book_key'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      author:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}author'],
          )!,
      isFav:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}is_fav'],
          )!,
      subjects: $FavoriteBooksTable.$convertersubjects.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}subjects'],
        )!,
      ),
    );
  }

  @override
  $FavoriteBooksTable createAlias(String alias) {
    return $FavoriteBooksTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertersubjects =
      const StringListConverter();
}

class FavoriteBook extends DataClass implements Insertable<FavoriteBook> {
  final int id;
  final int coverId;
  final int editionCount;
  final int firstPublicationYear;
  final String bookKey;
  final String title;
  final String author;
  final int isFav;
  final List<String> subjects;
  const FavoriteBook({
    required this.id,
    required this.coverId,
    required this.editionCount,
    required this.firstPublicationYear,
    required this.bookKey,
    required this.title,
    required this.author,
    required this.isFav,
    required this.subjects,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cover_id'] = Variable<int>(coverId);
    map['edition_count'] = Variable<int>(editionCount);
    map['first_publication_year'] = Variable<int>(firstPublicationYear);
    map['book_key'] = Variable<String>(bookKey);
    map['title'] = Variable<String>(title);
    map['author'] = Variable<String>(author);
    map['is_fav'] = Variable<int>(isFav);
    {
      map['subjects'] = Variable<String>(
        $FavoriteBooksTable.$convertersubjects.toSql(subjects),
      );
    }
    return map;
  }

  FavoriteBooksCompanion toCompanion(bool nullToAbsent) {
    return FavoriteBooksCompanion(
      id: Value(id),
      coverId: Value(coverId),
      editionCount: Value(editionCount),
      firstPublicationYear: Value(firstPublicationYear),
      bookKey: Value(bookKey),
      title: Value(title),
      author: Value(author),
      isFav: Value(isFav),
      subjects: Value(subjects),
    );
  }

  factory FavoriteBook.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteBook(
      id: serializer.fromJson<int>(json['id']),
      coverId: serializer.fromJson<int>(json['coverId']),
      editionCount: serializer.fromJson<int>(json['editionCount']),
      firstPublicationYear: serializer.fromJson<int>(
        json['firstPublicationYear'],
      ),
      bookKey: serializer.fromJson<String>(json['bookKey']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      isFav: serializer.fromJson<int>(json['isFav']),
      subjects: serializer.fromJson<List<String>>(json['subjects']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'coverId': serializer.toJson<int>(coverId),
      'editionCount': serializer.toJson<int>(editionCount),
      'firstPublicationYear': serializer.toJson<int>(firstPublicationYear),
      'bookKey': serializer.toJson<String>(bookKey),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'isFav': serializer.toJson<int>(isFav),
      'subjects': serializer.toJson<List<String>>(subjects),
    };
  }

  FavoriteBook copyWith({
    int? id,
    int? coverId,
    int? editionCount,
    int? firstPublicationYear,
    String? bookKey,
    String? title,
    String? author,
    int? isFav,
    List<String>? subjects,
  }) => FavoriteBook(
    id: id ?? this.id,
    coverId: coverId ?? this.coverId,
    editionCount: editionCount ?? this.editionCount,
    firstPublicationYear: firstPublicationYear ?? this.firstPublicationYear,
    bookKey: bookKey ?? this.bookKey,
    title: title ?? this.title,
    author: author ?? this.author,
    isFav: isFav ?? this.isFav,
    subjects: subjects ?? this.subjects,
  );
  FavoriteBook copyWithCompanion(FavoriteBooksCompanion data) {
    return FavoriteBook(
      id: data.id.present ? data.id.value : this.id,
      coverId: data.coverId.present ? data.coverId.value : this.coverId,
      editionCount:
          data.editionCount.present
              ? data.editionCount.value
              : this.editionCount,
      firstPublicationYear:
          data.firstPublicationYear.present
              ? data.firstPublicationYear.value
              : this.firstPublicationYear,
      bookKey: data.bookKey.present ? data.bookKey.value : this.bookKey,
      title: data.title.present ? data.title.value : this.title,
      author: data.author.present ? data.author.value : this.author,
      isFav: data.isFav.present ? data.isFav.value : this.isFav,
      subjects: data.subjects.present ? data.subjects.value : this.subjects,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteBook(')
          ..write('id: $id, ')
          ..write('coverId: $coverId, ')
          ..write('editionCount: $editionCount, ')
          ..write('firstPublicationYear: $firstPublicationYear, ')
          ..write('bookKey: $bookKey, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('isFav: $isFav, ')
          ..write('subjects: $subjects')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    coverId,
    editionCount,
    firstPublicationYear,
    bookKey,
    title,
    author,
    isFav,
    subjects,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteBook &&
          other.id == this.id &&
          other.coverId == this.coverId &&
          other.editionCount == this.editionCount &&
          other.firstPublicationYear == this.firstPublicationYear &&
          other.bookKey == this.bookKey &&
          other.title == this.title &&
          other.author == this.author &&
          other.isFav == this.isFav &&
          other.subjects == this.subjects);
}

class FavoriteBooksCompanion extends UpdateCompanion<FavoriteBook> {
  final Value<int> id;
  final Value<int> coverId;
  final Value<int> editionCount;
  final Value<int> firstPublicationYear;
  final Value<String> bookKey;
  final Value<String> title;
  final Value<String> author;
  final Value<int> isFav;
  final Value<List<String>> subjects;
  const FavoriteBooksCompanion({
    this.id = const Value.absent(),
    this.coverId = const Value.absent(),
    this.editionCount = const Value.absent(),
    this.firstPublicationYear = const Value.absent(),
    this.bookKey = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.isFav = const Value.absent(),
    this.subjects = const Value.absent(),
  });
  FavoriteBooksCompanion.insert({
    this.id = const Value.absent(),
    required int coverId,
    required int editionCount,
    required int firstPublicationYear,
    required String bookKey,
    required String title,
    required String author,
    required int isFav,
    required List<String> subjects,
  }) : coverId = Value(coverId),
       editionCount = Value(editionCount),
       firstPublicationYear = Value(firstPublicationYear),
       bookKey = Value(bookKey),
       title = Value(title),
       author = Value(author),
       isFav = Value(isFav),
       subjects = Value(subjects);
  static Insertable<FavoriteBook> custom({
    Expression<int>? id,
    Expression<int>? coverId,
    Expression<int>? editionCount,
    Expression<int>? firstPublicationYear,
    Expression<String>? bookKey,
    Expression<String>? title,
    Expression<String>? author,
    Expression<int>? isFav,
    Expression<String>? subjects,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (coverId != null) 'cover_id': coverId,
      if (editionCount != null) 'edition_count': editionCount,
      if (firstPublicationYear != null)
        'first_publication_year': firstPublicationYear,
      if (bookKey != null) 'book_key': bookKey,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (isFav != null) 'is_fav': isFav,
      if (subjects != null) 'subjects': subjects,
    });
  }

  FavoriteBooksCompanion copyWith({
    Value<int>? id,
    Value<int>? coverId,
    Value<int>? editionCount,
    Value<int>? firstPublicationYear,
    Value<String>? bookKey,
    Value<String>? title,
    Value<String>? author,
    Value<int>? isFav,
    Value<List<String>>? subjects,
  }) {
    return FavoriteBooksCompanion(
      id: id ?? this.id,
      coverId: coverId ?? this.coverId,
      editionCount: editionCount ?? this.editionCount,
      firstPublicationYear: firstPublicationYear ?? this.firstPublicationYear,
      bookKey: bookKey ?? this.bookKey,
      title: title ?? this.title,
      author: author ?? this.author,
      isFav: isFav ?? this.isFav,
      subjects: subjects ?? this.subjects,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (coverId.present) {
      map['cover_id'] = Variable<int>(coverId.value);
    }
    if (editionCount.present) {
      map['edition_count'] = Variable<int>(editionCount.value);
    }
    if (firstPublicationYear.present) {
      map['first_publication_year'] = Variable<int>(firstPublicationYear.value);
    }
    if (bookKey.present) {
      map['book_key'] = Variable<String>(bookKey.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (isFav.present) {
      map['is_fav'] = Variable<int>(isFav.value);
    }
    if (subjects.present) {
      map['subjects'] = Variable<String>(
        $FavoriteBooksTable.$convertersubjects.toSql(subjects.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteBooksCompanion(')
          ..write('id: $id, ')
          ..write('coverId: $coverId, ')
          ..write('editionCount: $editionCount, ')
          ..write('firstPublicationYear: $firstPublicationYear, ')
          ..write('bookKey: $bookKey, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('isFav: $isFav, ')
          ..write('subjects: $subjects')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteBooksTable favoriteBooks = $FavoriteBooksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteBooks];
}

typedef $$FavoriteBooksTableCreateCompanionBuilder =
    FavoriteBooksCompanion Function({
      Value<int> id,
      required int coverId,
      required int editionCount,
      required int firstPublicationYear,
      required String bookKey,
      required String title,
      required String author,
      required int isFav,
      required List<String> subjects,
    });
typedef $$FavoriteBooksTableUpdateCompanionBuilder =
    FavoriteBooksCompanion Function({
      Value<int> id,
      Value<int> coverId,
      Value<int> editionCount,
      Value<int> firstPublicationYear,
      Value<String> bookKey,
      Value<String> title,
      Value<String> author,
      Value<int> isFav,
      Value<List<String>> subjects,
    });

class $$FavoriteBooksTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteBooksTable> {
  $$FavoriteBooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get coverId => $composableBuilder(
    column: $table.coverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get editionCount => $composableBuilder(
    column: $table.editionCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstPublicationYear => $composableBuilder(
    column: $table.firstPublicationYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bookKey => $composableBuilder(
    column: $table.bookKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isFav => $composableBuilder(
    column: $table.isFav,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get subjects => $composableBuilder(
    column: $table.subjects,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$FavoriteBooksTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteBooksTable> {
  $$FavoriteBooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get coverId => $composableBuilder(
    column: $table.coverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get editionCount => $composableBuilder(
    column: $table.editionCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstPublicationYear => $composableBuilder(
    column: $table.firstPublicationYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bookKey => $composableBuilder(
    column: $table.bookKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isFav => $composableBuilder(
    column: $table.isFav,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjects => $composableBuilder(
    column: $table.subjects,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteBooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteBooksTable> {
  $$FavoriteBooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get coverId =>
      $composableBuilder(column: $table.coverId, builder: (column) => column);

  GeneratedColumn<int> get editionCount => $composableBuilder(
    column: $table.editionCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firstPublicationYear => $composableBuilder(
    column: $table.firstPublicationYear,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bookKey =>
      $composableBuilder(column: $table.bookKey, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<int> get isFav =>
      $composableBuilder(column: $table.isFav, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get subjects =>
      $composableBuilder(column: $table.subjects, builder: (column) => column);
}

class $$FavoriteBooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteBooksTable,
          FavoriteBook,
          $$FavoriteBooksTableFilterComposer,
          $$FavoriteBooksTableOrderingComposer,
          $$FavoriteBooksTableAnnotationComposer,
          $$FavoriteBooksTableCreateCompanionBuilder,
          $$FavoriteBooksTableUpdateCompanionBuilder,
          (
            FavoriteBook,
            BaseReferences<_$AppDatabase, $FavoriteBooksTable, FavoriteBook>,
          ),
          FavoriteBook,
          PrefetchHooks Function()
        > {
  $$FavoriteBooksTableTableManager(_$AppDatabase db, $FavoriteBooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FavoriteBooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$FavoriteBooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$FavoriteBooksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> coverId = const Value.absent(),
                Value<int> editionCount = const Value.absent(),
                Value<int> firstPublicationYear = const Value.absent(),
                Value<String> bookKey = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<int> isFav = const Value.absent(),
                Value<List<String>> subjects = const Value.absent(),
              }) => FavoriteBooksCompanion(
                id: id,
                coverId: coverId,
                editionCount: editionCount,
                firstPublicationYear: firstPublicationYear,
                bookKey: bookKey,
                title: title,
                author: author,
                isFav: isFav,
                subjects: subjects,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int coverId,
                required int editionCount,
                required int firstPublicationYear,
                required String bookKey,
                required String title,
                required String author,
                required int isFav,
                required List<String> subjects,
              }) => FavoriteBooksCompanion.insert(
                id: id,
                coverId: coverId,
                editionCount: editionCount,
                firstPublicationYear: firstPublicationYear,
                bookKey: bookKey,
                title: title,
                author: author,
                isFav: isFav,
                subjects: subjects,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteBooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteBooksTable,
      FavoriteBook,
      $$FavoriteBooksTableFilterComposer,
      $$FavoriteBooksTableOrderingComposer,
      $$FavoriteBooksTableAnnotationComposer,
      $$FavoriteBooksTableCreateCompanionBuilder,
      $$FavoriteBooksTableUpdateCompanionBuilder,
      (
        FavoriteBook,
        BaseReferences<_$AppDatabase, $FavoriteBooksTable, FavoriteBook>,
      ),
      FavoriteBook,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteBooksTableTableManager get favoriteBooks =>
      $$FavoriteBooksTableTableManager(_db, _db.favoriteBooks);
}
