import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../controllers/product_controller.dart';
import '../views/screens/product_detail_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

// ignore: camel_case_types
class GridView_Categroy extends StatelessWidget {
  const GridView_Categroy({
    super.key,
    required this.productController,
  });

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GridView.builder(
          itemCount: productController.categoryItemList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return ZoomTapAnimation(
              onTap: () {
                Get.to(
                  () => ProductDetailScreen(
                    image:
                        // ignore: unnecessary_string_interpolations
                        "${productController.categoryItemList[index].image}",
                    price: "${productController.categoryItemList[index].price}",
                    description:
                        // ignore: unnecessary_string_interpolations
                        "${productController.categoryItemList[index].description}",
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.grey[500],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl:
                              // ignore: unnecessary_string_interpolations
                              "${productController.categoryItemList[index].image}",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "\$${productController.categoryItemList[index].price}"),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  // ignore: unnecessary_string_interpolations
                                  "${productController.categoryItemList[index].title}",
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
