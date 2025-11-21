import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [
          // SEARCH BAR
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      hintText: "Search GIF...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.searchGifs(controller.searchController.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),

          // GIF GRID
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: controller.gifList.length,
                itemBuilder: (context, index) {
                  final gif = controller.gifList[index];
                  final imageUrl = gif["images"]["fixed_height"]["url"];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
