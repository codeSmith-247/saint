// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:busapp/bus_modal.dart';
import 'package:busapp/bus_list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(199, 61, 116, 245),
            title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          IconBox(icon: Icons.menu),
                          Text("City Ride", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      IconBox(icon: Icons.notifications),
                    ])),
          ),
          body: MySearchPage(),
        ));
  }
}

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key});

  @override
  State<MySearchPage> createState() => SearchPage();
}

class SearchPage extends State<MySearchPage> {
  static List<BusItem> busList = [
    BusItem('Accra To Kumasi', 'available'),
    BusItem('Accra To Tarkwa', 'available'),
    BusItem('Accra To Takoradi', 'available'),
    BusItem('kumasi To Cape-Coast', 'available'),
    BusItem('Accra To Koforidua', 'available'),
    BusItem('Accra To Sunyani', 'unavailable'),
  ];

  List<BusItem> displayList = List.from(busList);

  void updateList(String value) {
    setState(() {
      displayList = busList
          .where((element) =>
              element.location!.toLowerCase().contains(value.toLowerCase()) ||
              element.availability!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            SearchBox(
              callback: updateList,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.68,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: displayList.length,
                  itemBuilder: (context, index) => BusModal(
                        location: displayList[index].location!,
                        availability: displayList[index].availability!,
                      )),
            )
          ],
        ));
  }
}

class IconBox extends StatelessWidget {
  const IconBox({super.key, this.icon});

  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon));
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, this.callback});

  final dynamic callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: MediaQuery.of(context).size.height * 0.15,
      child: TextField(
        onChanged: (value) => callback(value),
        style: TextStyle(color: Color.fromARGB(255, 41, 41, 41)),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(121, 226, 219, 219),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintText: "e.g Type Your Search here",
          hintStyle:
              TextStyle(color: Color.fromARGB(113, 53, 52, 52), fontSize: 15),
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Color.fromARGB(255, 31, 153, 252),
        ),
      ),
    );
  }
}
