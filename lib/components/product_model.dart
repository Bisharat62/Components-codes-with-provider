class Product_model {
  String? name;
  dynamic price;
  dynamic imageurl;
  String? description;
  Product_model({
    this.name,
    this.price,
    this.imageurl,
    this.description,
  });
}

List<Product_model> electrical = [
  Product_model(
    name: "Product 1",
    price: "100",
    imageurl: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 1",
  ),
  Product_model(
    name: "Product 2",
    price: "200",
    imageurl: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 2",
  ),
  Product_model(
    name: "Product 3",
    price: "300",
    imageurl: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 3",
  ),
  Product_model(
    name: "Product 4",
    price: "400",
    imageurl: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 4",
  ),
  Product_model(
    name: "Product 5",
    price: "500",
    imageurl: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 5",
  ),
];
