import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  static Future<void> CreateUpdatebdgtourism(
      BuildContext context, String Dekripsi, String Namatempat, String Nomer, ) async {
    DocumentReference bdgtourismReference =
        FirebaseFirestore.instance.collection("bdgtourism").doc(Nomer);
    Map<String, dynamic> databdgtourism = {"Nomer": Nomer,"Dekripsi": Dekripsi, "Namatempat": Namatempat};
    bdgtourismReference.set(databdgtourism).whenComplete(() {
      Navigator.pop(context);
    });
  }

  static Future<void> deletebdgtourism(String Dekripsi) async {
    CollectionReference bdgtourismCollection =
        FirebaseFirestore.instance.collection('bdgtourism');
    return await bdgtourismCollection.doc(Dekripsi).delete();
  }
}
