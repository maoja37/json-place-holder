import 'dart:convert';

import 'package:dio/dio.dart';

class PostRepository {
  final Dio dio = Dio();

  Future<List<dynamic>> fetchPosts() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('There was an error somewehere');
    }
  }
}
