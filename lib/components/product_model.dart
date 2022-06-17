class Product_model {
  String? title;
  dynamic price;
  dynamic image;
  String? description;
  Product_model({
    this.title,
    this.price,
    this.image,
    this.description,
  });
  @override
  String toString() {
    return '{title: $title, price : $price,image:$image,description:$description}';
  }
}

List<Product_model> electrical = [
  Product_model(
    title: "electrical 1",
    price: "100",
    image: "https://images.pexels.com/photos/672111/pexels-photo-672111.jpeg",
    description: "This is product 1",
  ),
  Product_model(
    title: "electrical 2",
    price: "200",
    image: "https://images.pexels.com/photos/672111/pexels-photo-672111.jpeg",
    description: "This is product 2",
  ),
  Product_model(
    title: "electrical 3",
    price: "300",
    image: "https://images.pexels.com/photos/672111/pexels-photo-672111.jpeg",
    description: "This is product 3",
  ),
  Product_model(
    title: "electrical 4",
    price: "400",
    image: "https://images.pexels.com/photos/672111/pexels-photo-672111.jpeg",
    description: "This is product 4",
  ),
  Product_model(
    title: "electrical 5",
    price: "500",
    image: "https://images.pexels.com/photos/672111/pexels-photo-672111.jpeg",
    description: "This is product 5",
  ),
];

List<Product_model> furniture = [
  Product_model(
    title: "furniture 1",
    price: "100",
    image: "https://images.pexels.com/photos/1148955/pexels-photo-1148955.jpeg",
    description: "This is product 1",
  ),
  Product_model(
    title: "furniture 2",
    price: "200",
    image: "https://images.pexels.com/photos/1148955/pexels-photo-1148955.jpeg",
    description: "This is product 2",
  ),
  Product_model(
    title: "furniture 3",
    price: "300",
    image: "https://images.pexels.com/photos/1148955/pexels-photo-1148955.jpeg",
    description: "This is product 3",
  ),
  Product_model(
    title: "furniture 4",
    price: "400",
    image: "https://images.pexels.com/photos/1148955/pexels-photo-1148955.jpeg",
    description: "This is product 4",
  ),
  Product_model(
    title: "furniture 5",
    price: "500",
    image: "https://images.pexels.com/photos/1148955/pexels-photo-1148955.jpeg",
    description: "This is product 5",
  ),
];

List<Product_model> plumbing = [
  Product_model(
    title: "plumbing 1",
    price: "100",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 1",
  ),
  Product_model(
    title: "plumbing 2",
    price: "200",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 2",
  ),
  Product_model(
    title: "plumbing 3",
    price: "300",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 3",
  ),
  Product_model(
    title: "plumbing 4",
    price: "400",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 4",
  ),
  Product_model(
    title: "plumbing 5",
    price: "500",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 5",
  ),
];

List<Product_model> carpentry = [
  Product_model(
    title: "carpentry 1",
    price: "100",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 1",
  ),
  Product_model(
    title: "carpentry 2",
    price: "200",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 2",
  ),
  Product_model(
    title: "carpentry 3",
    price: "300",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 3",
  ),
  Product_model(
    title: "carpentry 4",
    price: "400",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 4",
  ),
  Product_model(
    title: "carpentry 5",
    price: "500",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 5",
  ),
];

List<Product_model> painting = [
  Product_model(
    title: "painting 1",
    price: "100",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 1",
  ),
  Product_model(
    title: "painting 2",
    price: "200",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 2",
  ),
  Product_model(
    title: "painting 3",
    price: "300",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 3",
  ),
  Product_model(
    title: "painting 4",
    price: "400",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 4",
  ),
  Product_model(
    title: "painting 5",
    price: "500",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 5",
  ),
];

List<Product_model> others = [
  Product_model(
    title: "others 1",
    price: "100",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 1",
  ),
  Product_model(
    title: "others 2",
    price: "200",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 2",
  ),
  Product_model(
    title: "others 3",
    price: "300",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 3",
  ),
  Product_model(
    title: "others 4",
    price: "400",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 4",
  ),
  Product_model(
    title: "others 5",
    price: "500",
    image: "https://source.unsplash.com/user/c_v_r/400x400",
    description: "This is product 5",
  ),
];
