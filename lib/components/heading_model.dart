import 'package:e_commerce_demo/components/product_model.dart';

class HeadingModel {
  String? name;
  List? navigation;
  HeadingModel({this.name, this.navigation});
}

List<HeadingModel> heading = [
  HeadingModel(name: 'Electrical', navigation: electrical),
  HeadingModel(name: 'Furniture', navigation: electrical),
  HeadingModel(name: 'Plumbing', navigation: electrical),
  HeadingModel(name: 'Carpentry', navigation: electrical),
  HeadingModel(name: 'Painting', navigation: electrical),
  HeadingModel(name: 'Other', navigation: electrical),
];
