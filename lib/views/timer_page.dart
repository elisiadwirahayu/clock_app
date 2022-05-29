import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? countdownTimer;
  Duration myDuration = Duration(hours: 1);

  @override
  void initState() {
    super.initState();
  }

  /// Timer related methods ///
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(hours: 1));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Timer (one hour)',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFEFEAD8),
                  fontSize: 24),
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              children: [
                buildTimeCard(time: hours, header: 'HOURS'),
                const SizedBox(width: 8,),
                buildTimeCard(time: minutes, header: 'MINUTES'),
                const SizedBox(width: 8,),
                buildTimeCard(time: seconds, header: 'SECONDS'),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: Text(
                    'Start',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF323032),
                          fontSize: 16
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEFEAD8),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                // Step 10
                ElevatedButton(
                  onPressed: () {
                    if (countdownTimer == null || countdownTimer!.isActive) {
                      stopTimer();
                    }
                  },
                  child: Text(
                    'Stop',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF323032),
                        fontSize: 16
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEFEAD8),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                // Step 11
                ElevatedButton(
                    onPressed: () {
                      resetTimer();
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF323032),
                          fontSize: 16
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEFEAD8),
                    ),
                )
              ],
            ),
          ],
        ),
    );
  }

  Widget buildTimeCard ({required String time, required String header}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xFFEFEAD8),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF323032).withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(4, 4),
                )
              ],
          ),
          child: Text(
            time,
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.bold,
                color: Color(0xFF323032),
                fontSize: 40
            ),
          ),
        ),
        const SizedBox(height: 24,),
        Text(
          header,
          style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.bold,
              color: Color(0xFFEFEAD8),
              fontSize: 12
          ),
        ),
      ],
    );
  }
}