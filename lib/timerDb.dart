import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clockiest/Components/Lap.dart';
class TimerDb extends ChangeNotifier {
  late Timer timer;
  Stopwatch stp = Stopwatch();
  int sec = 0;
  int min = 0;
  int hrs = 0;
  bool isStarted = false;
  bool isPaused = false;
  List<Lap> LapList = [];

  void startTimer() {
    if (!isStarted) {
      isStarted = true;
      isPaused = false;
      stp.start();
      updateDisplay();
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        updateDisplay();
        notifyListeners();
      });
    } else {
      pauseTimer();
    }
  }

  void stopTimer() {
    timer.cancel();
    stp.reset();
    stp.stop();
    isStarted = false;
    isPaused = false;
    sec = 0;
    min = 0;
    hrs = 0;
    resetLap();
    updateDisplay();
    notifyListeners();
  }

  void pauseTimer() {
    if (!isPaused) {
      isStarted = false;
      isPaused = true;
      timer.cancel();
      stp.stop();
      updateDisplay();
    }
    notifyListeners();
  }

  void addLap(int s, int m, int h) {
    LapList.add(Lap(s, m, h));
    notifyListeners();
  }

  void resetLap() {
    LapList.clear();
    notifyListeners();
  }

  void updateDisplay() {
    sec = stp.elapsed.inSeconds % 60;
    min = (stp.elapsed.inSeconds ~/ 60) % 60;
    hrs = stp.elapsed.inSeconds ~/ 3600;
    notifyListeners();
  }
}
