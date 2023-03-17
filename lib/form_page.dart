

import 'package:bandungtourism/database_services.dart';
import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  String Dekripsi = "";
  String Namatempat = "";
  String judul = "";
  String Nomer= "";

  FormPage({Key? key, this.Nomer="", this.Dekripsi = "", this.Namatempat = "", this.judul = ""});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String Dekripsi = "";
  String Namatempat = "";
  String judul = "";
  String Nomer="";
  var txtNomer= TextEditingController();
  var txtDekripsi = TextEditingController();
  var txtNamatempat = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtNomer.text=widget.Nomer;
    txtDekripsi.text = widget.Dekripsi;
    txtNamatempat.text = widget.Namatempat;
    Dekripsi = widget.Dekripsi;
    Namatempat = widget.Namatempat;
    Nomer = widget.Nomer;
    judul = widget.judul;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(judul),
        actions: [
          PopupMenuButton(
            onSelected: popupMenuClick,
            itemBuilder: (BuildContext context) {
              return {'Hapus',}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(children: [
                Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtNomer,
            decoration: InputDecoration(
              labelText: "Nomer",
              border: OutlineInputBorder(),
              hintText: "Masukkan Nomer",
            ),
            onChanged: (value) {
              setState(() {
                Nomer = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtNamatempat,
            decoration: InputDecoration(
              labelText: "Nama Tempat Wisata",
              border: OutlineInputBorder(),
              hintText: "Masukkan Nama Tempat Wisata",
            ),
            onChanged: (value) {
              setState(() {
                Namatempat = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtDekripsi,
            decoration: InputDecoration(
              labelText: "Dekripsi Tempat Wisata",
              border: OutlineInputBorder(),
              hintText: "Masukkan Dekripsi Tempat Wisata",
            ),
            onChanged: (value) {
              setState(() {
                Dekripsi = value;
              });
            },
          ),
        ),
        
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              DatabaseServices.CreateUpdatebdgtourism(context, Dekripsi, Namatempat, Nomer);
            },
            child: Text("simpan"))
      ]),
    );
  }

  void popupMenuClick(String value) {
    switch (value) {
      case 'Hapus':
        DatabaseServices.deletebdgtourism(widget.Nomer);
        Navigator.pop(context);
        break;
    }
  }
}
