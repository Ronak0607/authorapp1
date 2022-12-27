import 'package:authorapp/Screen/Controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BookdetailsScreen extends StatefulWidget {
  const BookdetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookdetailsScreen> createState() => _BookdetailsScreenState();
}

class _BookdetailsScreenState extends State<BookdetailsScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            }),
        title: Text("Details", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [],
      ),
    ));
  }
}
