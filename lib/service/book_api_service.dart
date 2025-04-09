
import 'dart:convert';
import 'package:f_book/common_const/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/book_model.dart';
import '../utils/network_check.dart';

class BookApiService{
  final String baseUrl = CommonString.getBooksUrl;

  Future<List<Books>> fetchBooks() async {
    bool isConnected = await NetworkService.hasInternetConnection();
    if (!isConnected) {
      throw Exception('No internet connection');
    }else{
      try {
        final response = await http.get(Uri.parse(baseUrl));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final List<dynamic> worksJson = data['works'];
          debugPrint("Fetched ${worksJson.length} books");
          return worksJson.map((json) => Books.fromJson(json)).toList();
        } else {
          throw Exception('Failed to load books. Status Code: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Error in fetching books, Please check Network connection');
      }
    }
  }
}