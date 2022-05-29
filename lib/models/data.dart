import 'package:clock_app/models/enums.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:flutter/material.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.timer, title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch, title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];