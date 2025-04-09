
import 'dart:async';
import 'dart:math';
import 'package:drift/drift.dart';
import 'package:f_book/model/book_data_model.dart';
import 'package:f_book/model/book_model.dart';
import 'package:flutter/cupertino.dart';
import '../local/database.dart';
import '../service/book_api_service.dart';

class BookViewModel extends ChangeNotifier {
  final BookApiService _apiService = BookApiService();
  List<BookData> allBooks = [];
  List<BookData> visibleBooks = [];
  int page = 0;
  final int pageSize = 7;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> loadBooks() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try{
      final list = await _apiService.fetchBooks();
      allBooks = getBookData(list);
      loadMore();
    }catch(e){
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();

  }

  Future<void> refreshBooks() async {
    await loadBooks();
  }

  void loadMore() {
    if ((page * pageSize) >= allBooks.length) return;

    final nextPageItems = allBooks.skip(page * pageSize).take(pageSize).toList();
    visibleBooks.addAll(nextPageItems);
    page++;
    debugPrint("the load more $page $pageSize ${allBooks.length}");

    isLoading = false;
    notifyListeners();
  }

  List<BookData> getBookData(List<Books> list){
    final resultList = list.map((book) =>
        BookData(key: book.key??"", title: book.title??"", coverI: book.coverId??0, editionCount: book.editionCount??0, firstPublishYear: book.firstPublishYear??0,
        subjects: book.subject, isFavorite: false, authors: book.authors!)).toList();
    return resultList;
  }

  void toggleFavorite(BookData book) {
    book.isFavorite = !(book.isFavorite);
    notifyListeners();
    if(book.isFavorite){
      addToFavorites(book);
    }else{
      removeFromFavorites(book.key);
    }
  }

  final db = AppDatabase.getInstance();
  List<FavoriteBook> _favorites = [];
  List<FavoriteBook> get favorites => _favorites;

  Future<void> loadFavorites() async {
    _favorites = await db.getAllFavorites();
    notifyListeners();
  }

  Future<void> addToFavorites(BookData book) async {
    await db.addFavorite(FavoriteBooksCompanion(id: Value(Random().nextInt(1000)),coverId: Value(book.coverI),editionCount: Value(book.editionCount),
    firstPublicationYear: Value(book.firstPublishYear),bookKey: Value(book.key),title: Value(book.title),author: Value(book.authors![0]),
        isFav: Value(book.isFavorite ? 1 : 0),subjects: Value(book.subjects!)));
    await loadFavorites();
  }

  Future<void> removeFromFavorites(String bookId) async {
    await db.removeFavorite(bookId);
    await loadFavorites();
  }

  bool isFavorite(String bookId) {
    return _favorites.any((b) => b.bookKey == bookId);
  }
}