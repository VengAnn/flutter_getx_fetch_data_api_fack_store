import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_fetch_facke_api/controllers/controller_bottom_navigationbar.dart';
import 'package:get_x_fetch_facke_api/views/screens/home_screen_product.dart';
import '../../controllers/product_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final productController = Get.put(ProductController());

  final controllerBottomNav = Get.put(ControllerBottomNav());

  // TabBar get _tabBar => const TabBar(
  //       indicatorColor: Colors.black,
  //       indicatorSize: TabBarIndicatorSize.tab,
  //       // indicator: BoxDecoration(
  //       //   color: Colors.green,
  //       //   borderRadius: BorderRadius.circular(30.0),
  //       // ),
  //       tabs: [
  //         Tab(text: "Page1"),
  //         Tab(text: "Page1"),
  //         Tab(text: "Page1"),
  //         Tab(text: "Page1"),
  //       ],
  //     );
  // //for tabbarview
  //           PreferredSize(
  //             preferredSize: _tabBar.preferredSize,
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(10.0),
  //                 child: Material(
  //                   color: Colors.grey,
  //                   child: _tabBar,
  //                 ),
  //               ),
  //             ),
  //           ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using GetX fetch api"),
      ),
      //
      body: PageView(
        onPageChanged: (value) {
          controllerBottomNav.animtationOnTap(value);
        },
        controller: controllerBottomNav.pageController,
        children: [
          HomeScreenProduct(),
          // ignore: avoid_unnecessary_containers
          Container(
            child: const Text("page2"),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: const Text("page2"),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: const Text("page2"),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _botttomAppBarItem(
                context,
                icon: IconlyLight.home,
                page: 0,
                lable: "Home",
              ),
              //
              _botttomAppBarItem(
                context,
                icon: IconlyLight.wallet,
                page: 1,
                lable: "Wallet",
              ),
              //
              _botttomAppBarItem(
                context,
                icon: IconlyLight.chart,
                page: 2,
                lable: "Chart",
              ),
              //
              _botttomAppBarItem(
                context,
                icon: IconlyLight.profile,
                page: 3,
                lable: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botttomAppBarItem(BuildContext context,
      {required icon, required page, required lable}) {
    return GetBuilder(
      init: controllerBottomNav,
      builder: (controller) {
        return ZoomTapAnimation(
          onTap: () {
            controllerBottomNav.goToTap(page);
          },
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                ),
                Text(
                  lable,
                  style: TextStyle(
                    color: controllerBottomNav.currentPage == page
                        ? Colors.black
                        : Colors.grey,
                    fontSize: 15,
                    fontWeight: controllerBottomNav.currentPage == page
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
