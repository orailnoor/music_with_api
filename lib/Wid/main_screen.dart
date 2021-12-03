import 'dart:convert';

import 'package:cryptocluster/Wid/listview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var mapResponse;
var stringResponse;
var listResponse;
var dataResponse;
// var s = 'datatata';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future Apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://res.cloudinary.com/dytnlsq2h/raw/upload/v1638265736/music.json"));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }

  @override
  void initState() {
    Apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.ac_unit),
            )
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    // Container(
                    //   color: Colors.amber,
                    //   child: Text(listResponse[index]['music'] as String),
                    // ),
                    Row(
                      children: [
                        Container(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Music(
                                    s: listResponse[index]['music']
                                        as String)));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 390,
                            child: Text(listResponse[index]['last_name']),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: listResponse == null ? 0 : listResponse.length,
        ));
  }
}
