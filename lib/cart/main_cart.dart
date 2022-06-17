import 'package:e_commerce_demo/main.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_widgets.dart';

class Main_Cart extends StatelessWidget {
  const Main_Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      bottomNavigationBar: Bottom_Nav_Bar(context),
      key: _scaffoldKey,
      endDrawer: menu(context),
      appBar: App_Bar(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
