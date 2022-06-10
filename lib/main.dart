// ignore_for_file: non_constant_identifier_names
import 'package:e_commerce_demo/components/product_model.dart';
import 'package:e_commerce_demo/provider/custom_nav_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/heading_model.dart';
import 'custom_widgets/custom_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Custom(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      endDrawer: menu(context),
      body: SingleChildScrollView(
        key: _scaffoldKey,
        child: Column(
          children: [
            Custom_App_Bar(context, _scaffoldKey),
            Show_headers(heading),
            Product_view_Horizental(electrical),
            SizedBox(
              height: 300,
              width: 300,
              child: Image.network(
                  'https://source.unsplash.com/user/c_v_r/1900x800'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget menu(context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Container(),
          decoration: const BoxDecoration(
            color: Color(0xffBFA2F2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80),
          child: ListTile(
            title: Text(
              ("User").toString(),
              style: const TextStyle(
                color: Color(0xffBFA2F2),
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: Text(
            'Home',
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.event),
          title: Text('My Events'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: Text('Calender'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.bookmark_added_outlined),
          title: Text('Booking'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.location_on_outlined),
          title: Text('Address'),
          onTap: () {},
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Expanded(
            child: Divider(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text('Setting'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: Text(
            'Log out',
          ),
          //onTap: ()=>logout(context),
        ),
      ],
    ),
  );
}
