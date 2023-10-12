import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  String lable;
  String time;

  TimeWidget(this.lable, this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            lable,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Shadow color
                    offset: Offset(0, 1), // Offset of the shadow (horizontal, vertical)
                    blurRadius: 4, // Spread of the shadow
                    spreadRadius: 1, // Expanding the shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade800),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
