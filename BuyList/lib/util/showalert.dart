import 'package:flutter/material.dart';

class ShowAlert extends StatelessWidget {
  final String message;
  ShowAlert({this.message}) {}
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text(message),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
    ;
  }
}
