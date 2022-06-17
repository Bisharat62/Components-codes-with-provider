import 'package:e_commerce_demo/api_call/api_model_class.dart';
import 'package:e_commerce_demo/custom_widgets/custom_widgets.dart';
import 'package:e_commerce_demo/custom_widgets/utils/product_hor_text.dart';
import 'package:e_commerce_demo/provider/custom_nav_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../get_started_screen/model/items_model.dart';

class Product_View extends StatefulWidget {
  dynamic product_data;
  Product_View({Key? key, this.product_data}) : super(key: key);

  @override
  State<Product_View> createState() => _Product_ViewState();
}

class _Product_ViewState extends State<Product_View> {
  horizental_view_text style = horizental_view_text();
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  products product = products();
  List images = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  checkimage() {
    if (widget.product_data.image.runtimeType == String) {
      images.add(widget.product_data.image);
    } else if (widget.product_data.image.runtimeType == List) {
      images = widget.product_data.image;
    }
  }

  void initState() {
    super.initState();
    checkimage();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Custom>(context);
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: App_Bar(scaffoldKey: _scaffoldKey),
          bottomNavigationBar: Bottom_Nav_Bar(context),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: (images.length > 0)
                          ? images.length
                          : listOfItems.length,
                      onPageChanged: (newIndex) {
                        setState(() {
                          currentIndex = newIndex;
                        });
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            (images.length > 0)
                                ? CacheImage(images[index], 250)
                                : animation(800, listOfItems[index].img),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: (images.length > 0)
                        ? images.length
                        : listOfItems.length,
                    onDotClicked: (newindex) {
                      setState(() {
                        currentIndex = newindex;
                        pageController.animateToPage(newindex,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn);
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // FutureBuilder<List<products>>(
                  //   future:provider.api_data,
                  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //     if (snapshot.hasData) {
                  //       List<products>? product = snapshot.data;
                  //       return
                  // Product_view_Horizental(provider.api_data),
                  //   } else {
                  //     return Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   }
                  // },
                  // ),
                  Text(
                    widget.product_data.title,
                    textAlign: TextAlign.center,
                    style: style.style,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Price :  " +
                          widget.product_data.price.toString() +
                          "  \$",
                      style: style.style,
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Description :",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway-Bold",
                      ),
                    ),
                  ),
                  Text(widget.product_data.description,
                      style: const TextStyle(
                          fontSize: 20, fontFamily: "Raleway-Medium"),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
          )),
    );
  }

  Widget animation(
    int delay,
    String path,
  ) {
    return FadeInImage(
      image: AssetImage(path),
      placeholder: AssetImage('assets/images/loading.gif'),
    );
  }
}
