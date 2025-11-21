import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  final searchController = TextEditingController();

  RxList gifList = [].obs;
  RxBool isLoading = false.obs;

  String apiKey = "gFVzWo677m3ijVsmVfHhdRcOpKuJevOx";

  @override
  void onInit() {
    super.onInit();
    fetchTrendingGifs(); 
  }

 
  Future<void> fetchTrendingGifs() async {
    try {
      isLoading.value = true;

      var url =
          "https://api.giphy.com/v1/gifs/trending?api_key=$apiKey&limit=25&offset=0&rating=g";

      var response = await http.get(Uri.parse(url));

      var data = jsonDecode(response.body);

      gifList.value = data["data"]; // list me daal do
    } catch (e) {
      print("ERROR ===> $e");
    } finally {
      isLoading.value = false;
    }
  }

  
  Future<void> searchGifs(String query) async {
    if (query.isEmpty) {
      fetchTrendingGifs();
      return;
    }

    try {
      isLoading.value = true;

      var url =
          "https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&limit=25&offset=0&rating=g&lang=en";

      var response = await http.get(Uri.parse(url));

      var data = jsonDecode(response.body);

      gifList.value = data["data"];
    } catch (e) {
      print("SEARCH ERROR ===> $e");
    } finally {
      isLoading.value = false;
    }
  }
}

// https://api.giphy.com/v1/gifs/trending?api_key=gFVzWo677m3ijVsmVfHhdRcOpKuJevOx&limit=25&offset=0&rating=g&bundle=messaging_non_clips
