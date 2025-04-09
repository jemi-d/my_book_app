import 'package:f_book/ui/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../local/database.dart';
import '../view_model/book_viewmodel.dart';
import 'book_card.dart';
import 'fav_book_list.dart';

class MyBookListPage extends StatefulWidget {
  const MyBookListPage({super.key});

  @override
  State<MyBookListPage> createState() => _MyBookListPageState();
}

class _MyBookListPageState extends State<MyBookListPage> {
  final ScrollController _scrollController = ScrollController();
  final db = AppDatabase.getInstance();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<BookViewModel>(context, listen: false);
      viewModel.loadBooks();
      viewModel.loadFavorites();
    });

    _scrollController.addListener(() {
      final vm = Provider.of<BookViewModel>(context, listen: false);
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100 &&
          !vm.isLoading) {
        vm.loadMore();
      }
    });
  }

  void refreshData(){
    Future.microtask((){
      if(!mounted) return;
      final viewModel = Provider.of<BookViewModel>(context, listen: false);
      viewModel.loadBooks();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final vm = Provider.of<BookViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('All Books',style: TextStyle(fontSize: 22,fontFamily: "Outfit-Medium"),), backgroundColor: Colors.brown.shade300,centerTitle: true,
      actions: [
        favoriteIconWithBadge(vm.favorites.length),
      ]),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.errorMessage.isNotEmpty ? Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(vm.errorMessage,style: TextStyle(fontSize: 18,color: Colors.red),),
              IconButton(onPressed: (){refreshData();}, icon: Icon(Icons.refresh))
            ],
          ),)
          :ListView.builder(
        controller: _scrollController,
        itemCount: vm.visibleBooks.length + 1,
        itemBuilder: (context, index) {
          if (index == vm.visibleBooks.length) {
            return  vm.visibleBooks.isNotEmpty ? SizedBox(width: 1,height: 1,)
                :
            Padding(padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final book = vm.visibleBooks[index];
          return GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailPage(bookData: book),),);
          },
          child: BookCard(bookData: book),);
        },
      ),
    );
  }

  Widget favoriteIconWithBadge(int favCount) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(clipBehavior: Clip.none,
        children: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/favBook');
          }, icon: Icon(Icons.favorite_border,size: 30,)),        // Badge only if count > 0
          if (favCount > 0)
            Positioned(top: -2, right: -2,
              child: Container(padding: EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle,),
                constraints: BoxConstraints(minWidth: 22, minHeight: 22),
                child: Center(child: Text('$favCount', style: TextStyle(color: Colors.white, fontSize: 12),),
                ),),
            )
          // Dot if count == 0
          else
            Positioned(top: 8, right: 8,
              child: Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle,),),
            ),
        ],
      ),
    );
  }
}

