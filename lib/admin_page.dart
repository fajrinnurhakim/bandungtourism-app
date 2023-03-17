import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bandungtourism/form_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Database Tempat Wisata"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormPage(judul: "Tambah Data Tempat Wisata");
          }));
        },
        child: Icon(Icons.add,),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('bdgtourism')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          print("${documentSnapshot["Namatempat"]}");
                          return Card(
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                leading: Text(documentSnapshot["Nomer"]),
                                title: Text(documentSnapshot["Namatempat"]),
                                subtitle: Text(documentSnapshot["Dekripsi"]),
                                
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return FormPage(judul: "Ubah Data Tempat Wisata",Nomer : documentSnapshot["Nomer"], Namatempat: documentSnapshot["Namatempat"],Dekripsi: documentSnapshot["Dekripsi"],);
                                }));
                              },
                            ),
                          );
                        });
                  } else {
                    return Text("Tidak ada data");
                  }
                })
          ],
        ),
      ),
    );
  }
}
