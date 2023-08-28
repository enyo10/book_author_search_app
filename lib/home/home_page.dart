import 'package:flutter/material.dart';
import 'package:book_author_search_app/home/controllers/home_page_controller.dart';

import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(" Search Author App"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: homePageController.textEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: homePageController.fetchAuthor,
                  child: const Icon(Icons.search),
                ),
                contentPadding: const EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(() => Text(
                homePageController.author.value.name,
                style: TextStyle(fontSize: 25),
              ))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
