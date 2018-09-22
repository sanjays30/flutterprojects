import './pages/homepage.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(BuyListApp());
}

class BuyListApp extends StatefulWidget{
  BuyListAppState createState()=>  BuyListAppState();
}

class BuyListAppState extends State<BuyListApp> {
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      title: 'title',
       home: HomePage(),
     );
  }
}