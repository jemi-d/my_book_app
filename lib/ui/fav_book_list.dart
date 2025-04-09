import 'package:f_book/model/book_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/book_viewmodel.dart';
import 'book_card.dart';
import 'book_details.dart';

class FavoriteBooksPage extends StatefulWidget {
  const FavoriteBooksPage({super.key});

  @override
  State<FavoriteBooksPage> createState() => _FavoriteBooksPageState();
}

class _FavoriteBooksPageState extends State<FavoriteBooksPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<BookViewModel>(context, listen: false);
      viewModel.loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookViewModel>(
      builder: (context, vm, child) {
        final favorites = vm.favorites;
        return Scaffold(
            appBar: AppBar(title: const Text('Favorite Books',style: TextStyle(fontSize: 22,fontFamily: "Outfit-Medium")), backgroundColor: Colors.brown.shade300,centerTitle: true,),
          body: favorites.isEmpty
              ? Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No favorites yet",style: TextStyle(fontSize: 18,color: Colors.red),),
                  ElevatedButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, '/books');
                  },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Adjust corner radius
                      ),
                      elevation: 5, // Shadow effect
                    ), child: Text("Go to All Books page",style: TextStyle(color: Colors.white),),),
                ],
              ))
              : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final book = favorites[index];
              final favBook = BookData(key: book.bookKey, title: book.title, coverI: book.coverId, editionCount: book.editionCount, firstPublishYear: book.firstPublicationYear, subjects: book.subjects, isFavorite: book.isFav == 1 ? true : false, authors: [book.author]);
              return GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailPage(bookData: favBook),),);
              },
                child: BookCard(bookData: favBook),);
            },
          ),
        );
      },
    );
  }
}
