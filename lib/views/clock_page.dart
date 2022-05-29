import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:clock_app/views/clock_view.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';

    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                'Clock',
                style: TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFEFEAD8),
                    fontSize: 24),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DigitalClockWidget(),
                  Text(
                    formattedDate,
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w300,
                        color: Color(0xFFEFEAD8),
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.center,
                child: ClockView(
                  size: MediaQuery.of(context).size.height / 4,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Timezone',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFEFEAD8),
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Color(0xFFEFEAD8),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'UTC' + offsetSign + timezoneString,
                        style:
                            TextStyle(color: Color(0xFFEFEAD8), fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DigitalClockWidgetState();
  }
}

class DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  late Timer timer;

  @override
  void initState() {
    this.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var perviousMinute = DateTime.now().add(Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute)
        if(! mounted) return;
        setState(() {
          formattedTime = DateFormat('HH:mm').format(DateTime.now());
        });
    });
    super.initState();
  }

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('=====>digital clock updated');
    return Text(
      formattedTime,
      style: TextStyle(
          fontFamily: 'avenir', color: Color(0xFFEFEAD8), fontSize: 64),
    );
  }
}
