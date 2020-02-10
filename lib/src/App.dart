import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:giver/src/Controller.dart';

import 'package:giver/src/screens/home_screen.dart';

class Giver extends AppMVC {
  Giver({Key key}) : super(con: _controller, key: key);

  /// External controller all views will communicate with
  static final Controller _controller = Controller();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
