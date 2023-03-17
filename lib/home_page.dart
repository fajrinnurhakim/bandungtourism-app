import 'package:bandungtourism/about_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bandungtourism/form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.green,
        title: Text("Bandung Tourism"),
        actions: [
              IconButton(
                icon: Icon(Icons.person_rounded),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => AboutPage(
                      ),
                    ),
                  );
                }
              ),
            ],
      ),
      
      body:  SingleChildScrollView(
        child:  Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('bdgtourism')
              .snapshots(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                      print("${documentSnapshot["Namatempat"]}");  
                      return Card(
                        child : ListTile(
                        leading: Text(documentSnapshot["Nomer"]),
                        title: Text(documentSnapshot["Namatempat"]),
                        subtitle: Text(documentSnapshot["Dekripsi"]),
                        
                      ),
                      );
                    },
                  );
                }else{
                  return Text("Tidak ada data");
                }
              },
            )
          ],)
      ),
    );
  }
}