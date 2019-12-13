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
          SizedBox(
            height: 20,
          ),
          Output(Theme.of(context).textTheme.display1),
          SizedBox(
            height: 5,
          ),
          Output(Theme.of(context).textTheme.display3),
          Expanded(child: Divider()),
          BottomTable(),
        ],
      ),
    );
  }
}

class Output extends StatelessWidget {
  final TextStyle textStyle;
  Output(this.textStyle);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        '0',
        style: textStyle,
      ),
    );
  }
}

class BottomTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Table(children: [
            TableRow(children: [
              CalcButtons(
                  buttonText: '+', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '-', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '×', color: Theme.of(context).primaryColor),
            ]),
            TableRow(children: [
              CalcButtons(
                  buttonText: '7', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '8', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '9', color: Theme.of(context).primaryColor),
            ]),
            TableRow(children: [
              CalcButtons(
                  buttonText: '4', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '5', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '6', color: Theme.of(context).primaryColor),
            ]),
            TableRow(children: [
              CalcButtons(
                  buttonText: '1', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '2', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '3', color: Theme.of(context).primaryColor),
            ]),
            TableRow(children: [
              CalcButtons(
                  buttonText: '.', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '0', color: Theme.of(context).primaryColor),
              CalcButtons(
                  buttonText: '( )', color: Theme.of(context).primaryColor),
            ]),
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Table(
            children: [
              TableRow(children: [
                CalcButtons(
                    buttonText: '÷', color: Theme.of(context).primaryColor),
              ]),
              TableRow(children: [
                CalcButtons(
                    buttonText: 'AC', color: Theme.of(context).primaryColor),
              ]),
              TableRow(children: [
                CalcButtons(
                    buttonText: 'C', color: Theme.of(context).primaryColor),
              ]),
              TableRow(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: CalcButtons(
                      buttonText: '=',
                      color: Theme.of(context).accentColor,
                      textColor: Colors.grey[900]),
                )
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

class CalcButtons extends StatefulWidget {
  final String buttonText;
  final Color color;
  final Color textColor;
  CalcButtons(
      {@required this.buttonText, @required this.color, this.textColor});

  @override
  _CalcButtonsState createState() => _CalcButtonsState();
}

class _CalcButtonsState extends State<CalcButtons> {
  void _performCalculation() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: MaterialButton(
          elevation: 0,
          color: widget.color,
          child: Text(widget.buttonText,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  color: (widget.textColor == null)
                      ? Colors.white
                      : widget.textColor)),
          onPressed: _performCalculation,
        ));
  }
}
