import 'package:book_author_search_app/repository/search_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../models/author.dart';

class HomePageController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  Rx<Author> author = Author(name: "", key: "").obs;

  void fetchAuthor() {
    String queryData = textEditingController.text;
    var repository = SearchRepository(Client());
    repository.fetchAuthor(queryData).then((value) => author = value.obs);
  }
}
