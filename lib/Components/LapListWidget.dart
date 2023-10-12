import 'package:flutter/material.dart';
import 'Lap.dart';

class LapListWidget extends StatelessWidget {
  List<Lap> lapList;

  LapListWidget(this.lapList);

  @override
  Widget build(BuildContext context) {
    if (lapList.isEmpty) {
      return Center(
        child: Text('No Laps Recorded Yet', style:TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 18
        ),),
      );
    }

    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: lapList.length,
        itemBuilder: (BuildContext context, int index) {
          final lapData = lapList[index];

          // Customize the appearance of each list item as needed
          return Container(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lap ${index + 1} : ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.brown.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                  child: Center(
                    child: Text(
                        '${lapData.hrs} : ${lapData.min} : ${lapData.sec}'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
