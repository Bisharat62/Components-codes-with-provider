import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/custom_nav_header.dart';

//---------------------------------------------App Bar----------------------------------------
Widget Custom_App_Bar(
    BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) {
  return Container(
    margin: const EdgeInsets.only(top: 30, left: 05, right: 05),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    height: 60,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.20),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Text.rich(
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
            )
          ],
        ),
        Row(
          children: [
            InkWell(onTap: () {}, child: const Icon(Icons.search)),
            const SizedBox(width: 25),
            InkWell(
              onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
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
                      color: Colors.black,
                    ),
                    Divider(
                      endIndent: 5,
                      height: 10,
                      thickness: 3,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

//---------------------------------------------Heading----------------------------------------

Widget Show_headers(List heading) {
  return Container(
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

Widget Product_view_Horizental(List electrical) {
  return SizedBox(
    height: 450,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: electrical.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var dark = Provider.of<Custom>(context);
          return Stack(children: [
            Container(
              // child: CacheImage(electrical[index].imageurl),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.75,
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(electrical[index].imageurl).image,
                  fit: BoxFit.cover,
                ),
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
                top: 330,
                left: 30,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 100,
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
                ))
          ]);
        }),
  );
}

Widget CacheImage(String url) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: url,
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(),
    ),
    // progressIndicatorBuilder: (context, url, downloadProgress) =>
    //     CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
