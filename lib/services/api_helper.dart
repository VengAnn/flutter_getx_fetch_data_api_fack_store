// ignore_for_file: unused_import

import 'dart:convert';
import 'package:quickalert/quickalert.dart';
import 'package:get_x_fetch_facke_api/models/product_res_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List<ProductResModel>> getAllProduct() async {
    try {
      final url = Uri.parse('https://fakestoreapi.com/products');
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      // print('$data'); //
      return data
          .map<ProductResModel>((e) => ProductResModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception("Erro get Product: $e");
    }
  }

  //get  category
  Future<List<String>> getProductCategory() async {
    try {
      final uri = Uri.parse("https://fakestoreapi.com/products/categories");
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      // print("data $data");
      return data.map<String>((e) => e.toString()).toList();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  //getCategoryProducdt Name
  Future<List<ProductResModel>> getProductCategoryName(String category) async {
    try {
      final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products/category/$category'));
      final data = jsonDecode(response.body);
      print("data GetCategory: $data");
      return data
          .map<ProductResModel>((e) => ProductResModel.fromJson(e))
          .toList();
    } catch (e) {
      // QuickAlert.show(
      //   context: context,
      //   type: QuickAlertType.error,
      //   title: 'Error get Category',
      //   text: 'Sorry, something went wrong',
      // );
      throw Exception("Error get Category: $e");
    }
  }
}
