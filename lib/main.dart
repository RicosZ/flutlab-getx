import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:getx_1/services/cookie.services.dart';
import 'package:getx_1/views/add_topic.view.dart';
import 'package:getx_1/views/category.view.dart';
import 'package:getx_1/views/fetch_topic.view.dart';
// import 'package:getx_1/views/home.view.dart';
import 'package:getx_1/views/login.view.dart';
import 'package:getx_1/views/topic.view.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(),
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/category', page: () => CategoryPage()),
        GetPage(name: '/topic', page: () => FecthTTopicView()),
        GetPage(name: '/topic/add', page: () => addTopicView()),
        GetPage(name: '/topic/:slugid', page: () => TopicView()),
      ],

      // home: HomePage(),
    );
  }
}
