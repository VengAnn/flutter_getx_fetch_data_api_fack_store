import 'package:get_x_fetch_facke_api/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_x_fetch_facke_api/models/product_res_model.dart';

class ProductController extends GetxController {
  //on this project using Getx simple stateManagement
  ApiHelper helper = ApiHelper();
  var isLoading = false;

  final List<ProductResModel> _product = [];
  //method get productlist;
  List<ProductResModel> get productList => _product;

  @override
  void onInit() {
    fetchAllProduct();
    getCategoryName();
    super.onInit();
  }

  //fetch all product
  void fetchAllProduct() async {
    try {
      isLoading = true;
      var result = await helper.getAllProduct();
      // ignore: unnecessary_null_comparison
      if (result != null) {
        _product.clear();
        _product.addAll(result);
      } else {
        print("somthing wrong fetch data");
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error while getting data is: $e");
    } finally {
      isLoading = false;
    }
    update();
  }

  //create method get categoryName
  final List<String> _categoryListName = [];
  List<String> get categoryNameList => _categoryListName;
  int selectedIndex = 0;
  void toggle(int index) {
    selectedIndex = index;
    update();
  }

  //
  void getCategoryName() async {
    try {
      isLoading = true;
      final result = await helper.getProductCategory();
      // ignore: unnecessary_null_comparison
      if (result != null) {
        _categoryListName.clear();
        _categoryListName.addAll(result);
      } else {
        print("something wrong get category Name");
      }
    } catch (e) {
      throw Exception('Error :$e');
    } finally {
      isLoading = false;
    }
    update();
  }
}
