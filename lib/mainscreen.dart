import 'package:clockiest/Components/TimeWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clockiest/timerDb.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'Components/LapListWidget.dart';

class mainScreen extends StatelessWidget {
  static String ScreenID = 'mainScreen';
  const mainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TimerDb>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align the TimeWidget contents at the top
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: TimeWidget('Hrs', value.hrs.toString())),
                            Text(':'),
                            Expanded(child: TimeWidget('Min', value.min.toString())),
                            Text(':'),
                            Expanded(child: TimeWidget('Sec', value.sec.toString())),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
               Container(height: 300,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                   color:  Colors.grey.shade800,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black26, // Shadow color
                       offset: Offset(0,
                           1), // Offset of the shadow (horizontal, vertical)
                       blurRadius: 4, // Spread of the shadow
                       spreadRadius: 1, // Expanding the shadow
                     ),
                   ]),
               child: LapListWidget(value.LapList),
               ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        value.addLap(value.sec, value.min, value.hrs);
                      },
                      child: Padding(
                        padding: EdgeInsets.only( right: 8),
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:  Colors.grey.shade800,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // Shadow color
                                  offset: Offset(0,
                                      1), // Offset of the shadow (horizontal, vertical)
                                  blurRadius: 4, // Spread of the shadow
                                  spreadRadius: 1, // Expanding the shadow
                                ),
                              ]),
                          child: Icon(
                            Icons.add,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          value.startTimer();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          height: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: value.isStarted
                                  ? Colors.grey.shade800
                                  : Colors.brown.shade300,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // Shadow color
                                  offset: Offset(0,
                                      1), // Offset of the shadow (horizontal, vertical)
                                  blurRadius: 4, // Spread of the shadow
                                  spreadRadius: 1, // Expanding the shadow
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Center(
                              child: Text(
                                value.isStarted ? 'Pause' : 'Start',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), GestureDetector(
                      onTap: (){
                        value.stopTimer();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:  Colors.grey.shade800,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // Shadow color
                                  offset: Offset(0,
                                      1), // Offset of the shadow (horizontal, vertical)
                                  blurRadius: 4, // Spread of the shadow
                                  spreadRadius: 1, // Expanding the shadow
                                ),
                              ]),
                          child: Icon(
                           Icons.refresh,
                          size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
