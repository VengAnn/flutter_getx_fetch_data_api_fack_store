import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../controllers/product_controller.dart';
import '../../widgets/grid_view_widget.dart';

class HomeScreenProduct extends StatelessWidget {
  HomeScreenProduct({super.key});
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder(
              init: productController,
              builder: (controller) {
                return ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: productController.categoryList.length,
                  itemBuilder: (context, index) {
                    String category = productController.categoryList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ZoomTapAnimation(
                          onTap: () {
                            //productController.toggle(index);
                            // productController.getCategoryName(category);
                            //print("${productController.getCategoryName(category)}");
                          },
                          child: InkWell(
                            onTap: () {
                              productController.getCategoryName(category);
                            },
                            splashColor: Colors.amber,
                            splashFactory: InkSparkle.splashFactory,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                    // ignore: unnecessary_string_interpolations
                                    "${productController.categoryList[index]}"),
                              ),
                            ),
                          )

                          // child: Center(
                          //   child: Text(
                          //     // ignore: unnecessary_string_interpolations
                          //     "${productController.categoryNameList[index]}",
                          //     style: const TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          //),
                          ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        GetBuilder(
          init: productController,
          builder: (controller) {
            return productController.isLoading
                ? const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        //this for Textfield search
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Search",
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    fillColor: Colors.grey[300],
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView_Widget(productController: productController),
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}
