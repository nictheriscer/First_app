//import packages needed
import 'package:flutter/material.dart';
//create the statelessWidget
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
//create the results
  // ignore: use_key_in_widget_constructors
  const Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = "you are so weird?!!!!!";
    }
    return resultText;
  }
//build the restart button
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            // ignore: prefer_const_constructors
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        FlatButton(
          child: Text('Restart Quiz!'),
          onPressed: resetHandler,
        )
      ],
    ));
  }
}
