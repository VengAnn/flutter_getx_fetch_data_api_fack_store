import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_fetch_facke_api/widgets/grid_view_category_widget.dart';
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
                return productController.isLoading
                    ? Container()
                    : ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.categoryList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return GetBuilder<ProductController>(
                              builder: (_) {
                                return ZoomTapAnimation(
                                  onTap: () {},
                                  child: InkWell(
                                    splashColor: Colors.amber,
                                    onTap: () {
                                      productController.toggle();
                                      // GridView_Widget(
                                      //     productController: productController);
                                    },
                                    child: Container(
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.grey,
                                      ),
                                      child: const Center(
                                          child: Text("All Products")),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            String category =
                                productController.categoryList[index - 1];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ZoomTapAnimation(
                                onTap: () {
                                  //productController.toggle(index);
                                  // productController.getCategoryName(category);
                                  //print("${productController.getCategoryName(category)}");
                                },
                                child: InkWell(
                                  onTap: () {
                                    productController.getCategoryName(category);
                                    productController.isClick = true;
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
                                          "${productController.categoryList[index - 1]}"),
                                    ),
                                  ),
                                ),

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
                          }
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

                        productController.isClick
                            ? GridView_Categroy(
                                productController: productController)
                            : GridView_Widget(
                                productController: productController),
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}
