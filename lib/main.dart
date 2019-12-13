import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;
import './output.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSC Calculator',
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
  String expression = '0';
  String result = '0';
  bool bracket = true;
  void _performCalculation(String exp) {
    setState(() {
      Parser p = Parser();
      if (exp == 'AC') {
        expression = '0';
        result = '0';
      } else if (exp == 'C') {
        expression = expression.substring(0, expression.length - 1);
      } else {
        if (exp == '=') {
          expression = expression.replaceAll('×', '*');
          expression = expression.replaceAll('÷', '/');
          Expression expr = p.parse(expression);
          result = '${expr.evaluate(EvaluationType.REAL, ContextModel())}';
          //result = expression;
          expression = '0';
        } else if (expression == '0') {
          expression = exp;
        } else if (exp == '( )') {
          if (bracket) {
            expression += '(';
            bracket = false;
          } else {
            expression += ')';
            bracket = true;
          }
        } else {
          expression += exp;
        }
      }
    });
  }

  Widget calcButtons(
      {@required String buttonText, @required Color color, Color textColor}) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: MaterialButton(
          elevation: 0,
          color: color,
          child: Text(buttonText,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: (textColor == null) ? Colors.white : textColor)),
          onPressed: () => _performCalculation(buttonText),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Output(fontSize: 30, result: expression),
          SizedBox(
            height: 5,
          ),
          Output(
            fontSize: 60,
            result: result,
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Table(children: [
                  TableRow(children: [
                    calcButtons(
                        buttonText: '+',
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).accentColor),
                    calcButtons(
                        buttonText: '-',
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).accentColor),
                    calcButtons(
                        buttonText: '×',
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).accentColor),
                  ]),
                  TableRow(children: [
                    calcButtons(
                        buttonText: '7', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '8', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '9', color: Theme.of(context).primaryColor),
                  ]),
                  TableRow(children: [
                    calcButtons(
                        buttonText: '4', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '5', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '6', color: Theme.of(context).primaryColor),
                  ]),
                  TableRow(children: [
                    calcButtons(
                        buttonText: '1', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '2', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '3', color: Theme.of(context).primaryColor),
                  ]),
                  TableRow(children: [
                    calcButtons(
                        buttonText: '.', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '0', color: Theme.of(context).primaryColor),
                    calcButtons(
                        buttonText: '( )',
                        color: Theme.of(context).primaryColor),
                  ]),
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: Table(
                  children: [
                    TableRow(children: [
                      calcButtons(
                          buttonText: '÷',
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).accentColor),
                    ]),
                    TableRow(children: [
                      calcButtons(
                          buttonText: 'AC',
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).errorColor),
                    ]),
                    TableRow(children: [
                      calcButtons(
                          buttonText: 'C',
                          color: Theme.of(context).primaryColor),
                    ]),
                    TableRow(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: calcButtons(
                            buttonText: '=',
                            color: Theme.of(context).accentColor,
                            textColor: Colors.grey[900]),
                      )
                    ]),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
