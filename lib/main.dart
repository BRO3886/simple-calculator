import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Calculator'),
        ),
        body: SimpleCalculator(),
      ),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      //padding: const EdgeInsets.all(6),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
            child: Text(
              '0',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
            child: Text(
              '0',
              style: Theme.of(context).textTheme.display3,
            ),
          ),
        ],
      ),
    );
  }
}
