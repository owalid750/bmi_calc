import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bool? isMale;
  final int? result;
  final int? age;
  // ignore: use_key_in_widget_constructors
  const ResultScreen({this.isMale, this.result, this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Result",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Result",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "$result",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ]),
      ),
    );
  }
}
