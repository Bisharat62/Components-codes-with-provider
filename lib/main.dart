// ignore_for_file: non_constant_identifier_names

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
    return Scaffold(
      body: Column(
        children: [
          Custom_App_Bar(),
          Show_headers(heading),
        ],
      ),
    );
  }
}
