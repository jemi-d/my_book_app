import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_book/model/book_data_model.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  final BookData bookData;
  const BookDetailPage({super.key, required this.bookData});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {

  List<String> allItems = [];
  List<String> visibleItems = [];
  final int _batchSize = 10;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if(widget.bookData.subjects != null){
      allItems = widget.bookData.subjects!;
    }
    _loadMoreItems();
  }

  void _loadMoreItems() {
    final nextItems = allItems.skip(_currentIndex).take(_batchSize).toList();
    setState(() {
      visibleItems.addAll(nextItems);
      _currentIndex += nextItems.length;
    });
  }

  int _calculateCrossAxisCount(double screenWidth) {
    if(screenWidth < 600){
      return 3;
    }else if(screenWidth < 800){
      return 4;
    }else{
      return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final crossAxisCount = _calculateCrossAxisCount(size.width);
    return Scaffold(
      appBar: AppBar(title: Text(widget.bookData.title,style: TextStyle(fontSize: 22,fontFamily: "Outfit-Medium")), backgroundColor: Colors.brown.shade300,centerTitle: true,),
      body: Container(width: size.width,
        padding: const EdgeInsets.all(10.0),
        child: checkOrientation(context,
          [
            Expanded(flex: 3,
              child: SizedBox(width: size.width,
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: 'https://covers.openlibrary.org/b/id/${widget.bookData.coverI}-S.jpg',
                          placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.black,)),
                          errorWidget: (context, url, error) => Icon(Icons.broken_image),
                          fit: BoxFit.fill,
                          width: 100,
                          height: 170,
                        ),
                      ),
                    ),
                    Positioned(left: 5,top: 5,
                      child: Icon(size: 32,
                        widget.bookData.isFavorite == false ? Icons.favorite_border : Icons.favorite,
                        color: widget.bookData.isFavorite == false ? Colors.black : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Expanded(flex: 7,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Expanded(flex:1,
                  child: Text(
                    widget.bookData.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(flex: 2,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 1,child: Text('First published year: ${widget.bookData.firstPublishYear}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),)),
                    Expanded(flex: 1,child: Text('Edition Count: ${widget.bookData.editionCount}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),)),
                    Expanded(flex: 1,child: Text('Author: ${widget.bookData.authors![0]}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),)),
                  ],
                )),
                  SizedBox(height: 5,),
                  Text("Subjects: ",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Expanded(flex: 6,
                    child: GridView.builder(padding: const EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 16,childAspectRatio: 1.3
                      ),
                      itemCount: visibleItems.length, itemBuilder: (context, index) {
                        return SizedBox(height: 20,width: 80,
                          child: Container(padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.brown.shade200),
                             alignment: Alignment.center, child: Text(visibleItems[index]),),
                        );
                      },
                    ),
                  ),
                  if (_currentIndex < allItems.length)
                    Container(padding: const EdgeInsets.all(5.0),height: 40,
                      child: ElevatedButton(onPressed: _loadMoreItems,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Adjust corner radius
                        ),
                        elevation: 5, // Shadow effect
                      ), child: Text("Load More",style: TextStyle(color: Colors.white),),),
                    )
                  else
                    Container(height:30,padding: const EdgeInsets.all(2.0), child: Text("All items loaded"),),
                ],),
            )
          ],
        ),
      ),
    );
  }

  Widget checkOrientation(BuildContext context,List<Widget> children) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: children)
        : Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: children);
  }

}
