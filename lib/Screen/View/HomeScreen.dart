import 'package:authorapp/Screen/Controller/HomeController.dart';
import 'package:authorapp/Screen/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Firebase/firebase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List allData = [];

  HomeController controller =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffcecece),
      appBar: AppBar(
        title: Text("Browse", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("detail");
            }, icon: Icon(
            Icons.add,
            size: 35,
            color: Colors.black,
          ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: readData(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<QueryDocumentSnapshot> listDocs = snapshot.data!.docs;
                    allData.clear();

                    for (var d1 in listDocs) {
                      var finaldeta = d1.data() as Map<String, dynamic>;

                      ModelData m1 = ModelData(
                        name: finaldeta['name'],
                        link: finaldeta['link'],
                        Aname: finaldeta['Aname'],
                        Aauthor: finaldeta['Aauthor'],
                        Abook: finaldeta['Abook'],
                        rating: finaldeta['rating'],
                        Pyear: finaldeta['Pyear'],
                      );
                      allData.add(m1);
                    }
                  }
                  return ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(25),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 60),
                              height: 280,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 105, right: 15, top: 40, bottom: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${allData[index].name}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 3,
                                          itemSize: 25,
                                          allowHalfRating: true,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("5.0",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${allData[index].Abook}",
                                      maxLines: 5,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 210,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 4)],
                                  borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(allData[index].link,fit: BoxFit.cover,),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    ));
  }
}
