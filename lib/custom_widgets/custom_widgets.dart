import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_demo/Product_view/product_view.dart';
import 'package:e_commerce_demo/cart/main_cart.dart';
import 'package:e_commerce_demo/components/product_model.dart';
import 'package:e_commerce_demo/custom_widgets/utils/product_hor_text.dart';
import 'package:e_commerce_demo/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/custom_nav_header.dart';

//---------------------------------------------App Bar----------------------------------------

class App_Bar extends StatelessWidget with PreferredSizeWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  App_Bar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);
  TextEditingController searching = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Custom>(context);
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.2),
      actions: [
        (provider.search)
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  provider.openSearch();
                },
                child: const Icon(
                  Icons.search,
                  size: 35,
                )),
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 15),
          child: InkWell(
            onTap: () => scaffoldKey.currentState!.openEndDrawer(),
            child: SizedBox(
              width: 30,
              height: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Divider(
                    indent: 5,
                    height: 10,
                    thickness: 3,
                    color: Colors.white,
                  ),
                  Divider(
                    endIndent: 5,
                    height: 10,
                    thickness: 3,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      title: (provider.search)
          ? Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              padding: const EdgeInsets.only(left: 20, top: 5, right: 15),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    controller: searching,
                    autofocus: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    searching.clear();
                    provider.openSearch();
                    if (kDebugMode) {
                      print(searching.text);
                    }
                  },
                  child: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ]))
          : const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Big',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Raleway-Bold")),
                  TextSpan(
                    text: 'ster',
                    style: TextStyle(fontFamily: "Raleway-Black", fontSize: 32),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//---------------------------------------------Heading----------------------------------------

Widget Show_headers(List heading) {
  List product = [electrical, furniture, plumbing, carpentry, painting, others];
  return SizedBox(
    height: 60,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: heading.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var dark = Provider.of<Custom>(context);
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 15),
              child: InkWell(
                onTap: () {
                  dark.changeheading(index);
                  dark.changeproduct(product[index]);
                },
                child: Text(
                  heading[index].name,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Raleway-Bold",
                    color: (dark.heading == index)
                        ? Colors.black
                        : Colors.grey.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ]);
        }),
  );
}

//---------------------------------------------Product View Horizental--------------------------------

Widget Product_view_Horizental(dynamic electrical) {
  horizental_view_text style = horizental_view_text();
  return SizedBox(
    height: 450,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: electrical.length ?? 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var dark = Provider.of<Custom>(context);
          return Stack(children: [
            Container(
              // child: CacheImage(electrical[index].imageurl),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.75,
              height: 380,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: CachedNetworkImageProvider(electrical[index].imageurl),
                //   fit: BoxFit.cover,
                // ),
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: (electrical[index].image != null)
                  ? CacheImage(electrical[index].image, 380)
                  : const Center(child: CircularProgressIndicator()),
            ),
            Positioned(
                top: 330,
                left: 30,
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 140,
                              height:
                                  (electrical[index].title != null) ? 30 : 20,
                              color: (electrical[index].title != null)
                                  ? Colors.transparent
                                  : Colors.grey[300],
                              child: Text(
                                electrical[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: style.style,
                              ),
                            ),
                            Text(
                              electrical[index].price.toString(),
                              style: style.style,
                            )
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              dark.addtocart(dark.product[index]);
                              // print("---------------------------------------");
                              //print(dark.cart.length);
                            },
                            child: Text(
                              "Add To Cart",
                              style: style.style,
                            ))
                      ],
                    )))
          ]);
        }),
  );
}

Widget CacheImage(String url, double? height1) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    height: height1,
    imageUrl: url,
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(),
    ),
    // progressIndicatorBuilder: (context, url, downloadProgress) =>
    //     CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

//---------------------------------------------Bottom NavBar--------------------------------

Widget Bottom_Nav_Bar(context) {
  var provider = Provider.of<Custom>(context);
  List navbar = const <IconData>[
    Icons.home,
    Icons.discount_rounded,
    (Icons.shopping_cart),
    (Icons.person)
  ];
  return BottomAppBar(
    clipBehavior: Clip.hardEdge,
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(244, 91, 60, 1),
          borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ListView.builder(
        itemCount: navbar.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.21,
            height: 52,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: (index == provider.nav_bar)
                      ? Colors.black
                      : Colors.transparent,
                  width: 3.5,
                ),
              ),
            ),
            child: Center(
                child: (index == 2)
                    ? InkWell(
                        onTap: () {
                          provider.changeNav(index);
                          if (kDebugMode) {
                            print(provider.nav_bar);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Main_Cart()));
                        },
                        child: icon_cart(context, index))
                    : InkWell(
                        onTap: () {
                          provider.changeNav(index);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        },
                        child: Icon(
                          navbar[index],
                          size: (index == provider.nav_bar) ? 40 : 25,
                        ),
                      )),
          );
        },
      ),
    ),
  );
}

Widget icon_cart(context, int item) {
  var provider = Provider.of<Custom>(context);
  return (provider.cart.length > 0)
      ? Stack(
          children: [
            Icon(
              Icons.shopping_cart,
              size: (item == provider.nav_bar) ? 40 : 30,
            ),
            Positioned(
              left: (provider.cart.length < 10) ? 20 : 15,
              child: Text(
                provider.cart.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
      : Icon(
          Icons.shopping_cart_outlined,
          size: (item == provider.nav_bar) ? 40 : 30,
        );
}

class Horizental_view extends StatelessWidget {
  bool? loading;
  double? back_height;
  double? back_width;
  double? front_height;
  double? front_width;
  double? top_space;
  double? left_space;
  dynamic? product;
  Horizental_view(
      {required this.loading,
      this.back_height,
      this.back_width,
      this.front_height,
      this.front_width,
      this.top_space,
      this.left_space,
      this.product});

  @override
  Widget build(BuildContext context) {
    horizental_view_text style = horizental_view_text();

    return SizedBox(
      height: 450,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: (loading == true) ? product.length : 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            var dark = Provider.of<Custom>(context);
            return InkWell(
              onTap: () {
                if (loading == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Product_View(
                                product_data: product[index],
                              )));
                }

                // print(product[index]);
                // if (product[index].image.runtimeType == String) {
                //   a.add(product[index].image);
                //   print(a);
                // }
                // print(product[index].image.runtimeType);
              },
              child: Stack(children: [
                Container(
                  // child: CacheImage(electrical[index].imageurl),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: back_width ?? 250,
                  height: back_height ?? 300,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: CachedNetworkImageProvider(electrical[index].imageurl),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: (loading == true)
                      ? CacheImage(
                          product[index].image,
                          back_height ?? 250,
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
                Positioned(
                    top: top_space ?? 330,
                    left: left_space ?? 30,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: front_width ?? 220,
                        height: front_height ?? 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 5,
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 120,
                                  height: (loading == true) ? 30 : 20,
                                  color: (loading == true)
                                      ? Colors.transparent
                                      : Colors.grey[300],
                                  child: Text(
                                    (loading == true)
                                        ? product[index].title.toString()
                                        : "",
                                    overflow: TextOverflow.ellipsis,
                                    style: style.style,
                                  ),
                                ),
                                Text(
                                  (loading == true)
                                      ? product[index].price.toString() + "\$"
                                      : "Price",
                                  style: style.style,
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  dark.addtocart(dark.product[index]);
                                  // print("---------------------------------------");
                                  //print(dark.cart.length);
                                },
                                child: Text(
                                  "Add To Cart",
                                  style: style.style,
                                ))
                          ],
                        )))
              ]),
            );
          }),
    );
  }
}
