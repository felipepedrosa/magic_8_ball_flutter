import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MaterialApp(
    title: 'Magic 8 ball',
    home: BallPage(),
  ));
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask me anything!'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.white),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Informações'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Desenvolvedor: Felipe Pedrosa'),
                    Text('Email: felipeepedrosa@gmail.com'),
                    Text('Github: felipepedrosa'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  var _ballNumber = 1;

  void _handleBallClick() {
    setState(() {
      _ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: MaterialButton(
        child: Image.asset('images/ball$_ballNumber.png'),
        onPressed: _handleBallClick,
      ),
    );
  }
}
