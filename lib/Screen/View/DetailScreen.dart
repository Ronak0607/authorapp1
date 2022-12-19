import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Firebase/firebase.dart';
import '../Controller/HomeController.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtlink = TextEditingController();
  TextEditingController txtAname = TextEditingController();
  TextEditingController txtAauthor = TextEditingController();
  TextEditingController txtAbook = TextEditingController();
  TextEditingController txtrating = TextEditingController();
  TextEditingController txtPyear = TextEditingController();

  HomeController controller =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){

            }),
            title: Text("Add Book", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: txtname,
                      decoration: InputDecoration(

                          hintText: "Name",
                          prefixIcon: Icon(Icons.book),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: txtlink,
                      decoration: InputDecoration(
                          hintText: "Image Link",
                          prefixIcon: Icon(Icons.image),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: txtAname,
                      decoration: InputDecoration(
                          hintText: "Author Name",
                          prefixIcon: Icon(Icons.edit),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: txtAauthor,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "About Author ",
                          prefixIcon: Icon(Icons.menu_book),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: txtAbook,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "About Book",
                          prefixIcon: Icon(Icons.star),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: txtrating,
                      decoration: InputDecoration(
                          hintText: "Rating",
                          prefixIcon: Icon(Icons.calendar_month),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: txtPyear,
                      decoration: InputDecoration(
                          hintText: "Publish Year",
                          prefixIcon: Icon(Icons.book),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {
                    insertData(
                        txtname.text,
                        txtlink.text,
                        txtAname.text,
                        txtAauthor.text,
                        txtAbook.text,
                        txtrating.text,
                        txtPyear.text);

                    Get.back();
                  }, child: Text("Finish"))
                ],
              ),
            ),
          ),
        ));
  }
}
