import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void insertData(String name, String link, String Aname, String Aauthor,
    String Abook, String rating, String Pyear) {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference collectionReference =
      firebaseFirestore.collection("Author");
  collectionReference.add({
    "name": "$name",
    "link": "$link",
    "Aname": "$Aname",
    "Aauthor": "$Aauthor",
    "Abook": "$Abook",
    "rating": "$rating",
    "Pyear": "$Pyear",
  });
}

Stream<QuerySnapshot<Map<String, dynamic>>> readData()
{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  return firebaseFirestore.collection("Author").snapshots();

}

