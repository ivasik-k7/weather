import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wapp/ui/pages/home/home.main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeMain())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: Center(
          child: Image.network(
              'https://s12.favim.com/gif_previews/3/316/3166/31660/3166025.gif'),
        ),
      ),
    );
  }
}
