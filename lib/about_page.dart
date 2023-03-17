import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text("Halaman About"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              child: Row(children: [
                Container(
                  height: 160,
                  width: 100,
                  child: Image.asset('image/1.jpg'),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 160,
                    child: Column(
                      children: [
                        Text('Anggota 1'),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text('Nama : -'),
                        ),
                        Expanded(
                          child: Text('Nim : -'),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Card(
              elevation: 5,
              child: Row(children: [
                Container(
                  height: 160,
                  width: 100,
                  child: Image.asset('image/2.jpg'),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 160,
                    child: Column(
                      children: [
                        Text('Anggota 2'),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text('Nama : - '),
                        ),
                        Expanded(
                          child: Text('Nim : -'),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Card(
              elevation: 5,
              child: Row(children: [
                Container(
                  height: 160,
                  width: 100,
                  child: Image.asset('image/3.jpg'),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 160,

                    child: Column(
                      children: [
                        Text('Anggota 3'),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text('Nama : - '),
                        ),
                        Expanded(
                          child: Text('Nim : -'),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Card(
              elevation: 5,
              child: Row(children: [
                Container(
                  height: 160,
                  width: 100,
                  child: Image.asset('image/4.jpg'),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 160,
                    child: Column(
                      children: [
                        Text('Anggota 4'),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text('Nama : -'),
                        ),
                        Expanded(
                          child: Text('Nim : -'),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}