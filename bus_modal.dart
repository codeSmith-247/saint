import 'package:flutter/material.dart';

class BusModal extends StatelessWidget {
  const BusModal(
      {super.key, required this.location, required this.availability});

  final String location;
  final String availability;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(28, 43, 43, 42),
              blurRadius: 0.5,
              spreadRadius: 1, //New
            )
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.085,
              width: MediaQuery.of(context).size.width * 0.165,
              decoration: BoxDecoration(
                color: const Color.fromARGB(199, 61, 116, 245),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.location_pin, size: 30, color: Color.fromARGB(255, 255, 255, 255))),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(location,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 45, 45, 45))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text(availability,
                    style: const TextStyle(
                        color: Color.fromARGB(225, 55, 55, 55))),
              ],
            ),
          )
        ]));
  }
}
