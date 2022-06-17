import 'package:e_commerce_demo/api_call/api_model_class.dart';
import 'package:e_commerce_demo/components/product_model.dart';
import 'package:flutter/cupertino.dart';

class Custom with ChangeNotifier {
  int heading = 0;
  int navbar = 0;
  bool search = false;
  List product = electrical;
  dynamic cart = [];
  int nav_bar = 0;
  List<products> api_data = [];
  bool loading = false;
  changeheading(int value) {
    heading = value;
    notifyListeners();
  }

  changenabar(int value) {
    navbar = value;
    notifyListeners();
  }

  openSearch() {
    search = !search;
    notifyListeners();
  }

  changeproduct(List item) {
    product = item;
    notifyListeners();
  }

  addtocart(dynamic item) {
    cart.add(item);
    notifyListeners();
  }

  changeNav(int value) {
    nav_bar = value;
    notifyListeners();
  }

  get_api() async {
    api_data = await fetchapi();
    loading = true;
    notifyListeners();
  }
}
