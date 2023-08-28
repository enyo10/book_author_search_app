import 'package:book_author_search_app/helper/constants.dart';
import 'package:http/http.dart' as http;

import '../models/author.dart';

class SearchRepository {
  final http.Client client;
  SearchRepository(this.client);
  Future<dynamic> fetchAuthor(String queryData) async {
    final uri = Uri.parse("${Constants.baseUrl}?q=$queryData");
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      //return Author.fromJson(response.body);
      return response.body;
    }
    throw Exception('Some Error Occurred');

  }

  Future<dynamic> searchAuthor() async {
    final response = await client.get(
      Uri.parse('${Constants.baseUrl}?q=flammable'),
    );
    if (response.statusCode == 200) {
      print(response.body);

      return Author.fromJson(response.body);


     // return response.body;
    }
    throw Exception('Some Error Occurred');
  }
}
