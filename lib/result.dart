import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  String get resultPhase {
    var resultText;
    if (resultScore == 30) {
      resultText = 'You are a GOD!';
    } else if (resultScore > 20) {
      resultText = 'Ayy not bad tho';
    } else if (resultScore > 10) {
      resultText = 'I don\'t know if I like you yet...';
    } else {
      resultText = 'Get out of here smh';
    }
    return resultText;
  }

  Result(this.resultScore, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Text('Restart Quiz'),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
