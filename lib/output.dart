import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  final double fontSize;
  final String result;
  Output({@required this.fontSize, this.result});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        (result == null) ? '0' : result,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
    );
  }
}
