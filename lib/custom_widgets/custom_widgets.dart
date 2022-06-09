import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/custom_nav_header.dart';

//---------------------------------------------App Bar----------------------------------------
Widget Custom_App_Bar() {
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
            SizedBox(
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
          ],
        )
      ],
    ),
  );
}

//---------------------------------------------Heading----------------------------------------

Widget Show_headers(List heading) {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: heading.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var dark = Provider.of<Custom>(context);
          return Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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

Widget Product_view_Horizental(List heading) {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: heading.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var dark = Provider.of<Custom>(context);
          return Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
