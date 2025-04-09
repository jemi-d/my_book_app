

class BookData{
  String key;
  String title;
  int coverI;
  int editionCount;
  int firstPublishYear;
  List<String>? subjects;
  List<String>? authors;
  bool isFavorite;

  BookData({
    required this.key,required this.title,required this.coverI,
    required this.editionCount, required this.firstPublishYear,
    required this.subjects, required this.isFavorite, required this.authors
  });

}

