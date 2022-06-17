// ignore_for_file: non_constant_identifier_names
import 'package:e_commerce_demo/Product_view/product_view.dart';
import 'package:e_commerce_demo/get_started_screen/main_view.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Custom>(context, listen: false).get_api();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    var item = Provider.of<Custom>(context);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: menu(context),
      bottomNavigationBar: Bottom_Nav_Bar(context),
      appBar: App_Bar(
        scaffoldKey: _scaffoldKey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom_App_Bar(context, _scaffoldKey),
            Show_headers(heading),
            Product_view_Horizental(item.product),
            Horizental_view(product: item.api_data, loading: item.loading),
            Product_view_Horizental(item.api_data),
            SizedBox(
              height: 300,
              width: 300,
              child: CacheImage(
                  'https://source.unsplash.com/user/c_v_r/1900x800', 300),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Get_started_Screen(),
                    ),
                  );
                },
                child: const Text("Get Started")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Product_View(),
                    ),
                  );
                },
                child: const Text("Product View")),
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
        const DrawerHeader(
          child: const SizedBox(),
          decoration: BoxDecoration(
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
          title: const Text(
            'Home',
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.event),
          title: const Text('My Events'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: const Text('Calender'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.bookmark_added_outlined),
          title: const Text('Booking'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.location_on_outlined),
          title: const Text('Address'),
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
          title: const Text('Setting'),
          onTap: () {},
        ),
        const ListTile(
          leading: Icon(Icons.logout_outlined),
          title: Text(
            'Log out',
          ),
          //onTap: ()=>logout(context),
        ),
      ],
    ),
  );
}
