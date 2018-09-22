import 'package:flutter/material.dart';
class ShowConfirmation extends StatelessWidget {
  final Function onOk;
  final String data;
  final String message;
  ShowConfirmation({this.onOk, this.data, this.message}){
    
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                title: Text('Confirmation'),
                content: Text(message),
                actions: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onOk(data);
                    },
                    child: Text('OK'),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('CANCEL'),
                  )
                ],
              );;
  }
}