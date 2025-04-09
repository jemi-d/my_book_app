import 'package:f_book/ui/book_details.dart';
import 'package:f_book/ui/book_list.dart';
import 'package:f_book/ui/fav_book_list.dart';
import 'package:f_book/view_model/book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Outfit',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => MyHomePage(title: "My Books App"),
          '/books' : (context) => MyBookListPage(),
          '/favBook' : (context) => FavoriteBooksPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),color: Colors.brown.shade200,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.title,style: Theme.of(context).textTheme.headlineLarge,),
        Text('Welcome To My Books App',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 30,),
        Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
          Expanded(flex: 1,
            child: Container(width: 100,
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/books');
              },  style: ElevatedButton.styleFrom(backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust corner radius
                ),
                elevation: 5, // Shadow effect
              ),child: Text("All Books",style: TextStyle(color: Colors.white),)),
            ),
          ),SizedBox(width: 10,),
          Expanded(flex: 1,
            child: Container(width: 100,
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/favBook');
              }, style: ElevatedButton.styleFrom(backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust corner radius
                ),
                elevation: 5, // Shadow effect
              ), child: Text("Favorite Books",style: TextStyle(color: Colors.white),)),
            ),
          )
        ],)
      ],),
    );
  }
}
