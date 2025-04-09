import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/book_data_model.dart';
import '../view_model/book_viewmodel.dart';

class BookCard extends StatelessWidget {
  final BookData bookData;
  const BookCard({super.key, required this.bookData});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BookViewModel>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Container(margin: EdgeInsets.all(10),width: size.width,height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.brown.shade200,),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2,
            child: Container(height: 100, padding: const EdgeInsets.all(8.0),
              child: bookData.coverI != null
                  ?
              ClipRRect(borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: 'https://covers.openlibrary.org/b/id/${bookData.coverI}-S.jpg',
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.black,)),
                  errorWidget: (context, url, error) => Icon(Icons.broken_image),
                  fit: BoxFit.fill,
                  width: 70,
                ),
              )


              // Image.network('https://covers.openlibrary.org/b/id/${bookData.coverI}-S.jpg', width: 50,)
                  :  Icon(Icons.book),
            ),
          ),

          Expanded(flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1,child: Text(bookData.title, style: TextStyle(fontFamily: "Outfit-Medium",fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  Expanded(flex: 1,child: Text('Edition Count: ${bookData.editionCount}',style: const TextStyle(fontSize: 16, fontFamily: "Outfit-Extra-Light"),)),
                  Expanded(flex: 1,child: Text('Author: ${bookData.authors![0]}',style: const TextStyle(fontSize: 16, fontFamily: "Outfit-Extra-Light"),)),
                ],
              ),
            ),
          ),
          Expanded(flex: 1,
            child:  IconButton(
              icon: Icon(
                bookData.isFavorite == false ? Icons.favorite_border : Icons.favorite,
                color: bookData.isFavorite == false ? Colors.black : Colors.black,
              ),
              onPressed: () {
                vm.toggleFavorite(bookData);
              },
            ),)
        ],
      ),);
  }
}

