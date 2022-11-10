import 'package:flutter/material.dart';

class builder extends StatelessWidget {
  final String child;
  final String name;

  builder({required this.child, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Color.fromARGB(255, 7, 80, 139)]),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey[400],
                    child: Icon(
                      Icons.location_pin,
                      size: 38,
                      color: Color.fromARGB(255, 25, 216, 32),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child,
                      style: TextStyle(
                        color: Colors.grey[350],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
