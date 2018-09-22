import 'dart:async';
import 'dart:convert';
import '../util/showalert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/itemdto.dart';

class HomePage extends StatefulWidget {
  //final Set<String> listitems = Set.from(['Yogurt', 'Lentils']);
  final Set<ItemDTO> buyList = Set();
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  bool _isLoading = false;
  HomePageState() {
    //Show error message on error
    fetchAllItems().then((onValue) {
      print(onValue);
      ShowAlert(
        message: "Some Error occured loading",
      );
    });
  }
  // Then show a snackbar!
  Future<bool> removeItem(ItemDTO dto) async {
    this._isLoading = true;
    final http.Response response = await http
        .delete('https://flutter-sks.firebaseio.com/buylist/${dto.id}.json');
    this._isLoading = false;
    if (response.statusCode != 200 && response.statusCode != 202) {
      return false;
    }
    setState(() {
      widget.buyList.remove(dto);
    });
    return true;
  }

  Future<bool> fetchAllItems() async {
    this._isLoading = true;
    final http.Response response =
        await http.get('https://flutter-sks.firebaseio.com/buylist.json');
    //print(json.decode(response.body));
    final Map<String, dynamic> buyListDataMap = json.decode(response.body);
    _isLoading = false;

    if (response.statusCode != 200 && response.statusCode != 201) {
      return false;
    }
    setState(() {
      buyListDataMap.forEach((key, json) {
        print(json);
        widget.buyList.add(ItemDTO.fromJson(key, json));
      });
    });

    return true;
  }

  Future<ItemDTO> addItem(String itemName, String createdBy) async {
    _isLoading = true;
    ItemDTO data = ItemDTO(itemName: itemName, createdBy: createdBy);
    final http.Response response = await http.post(
        'https://flutter-sks.firebaseio.com/buylist.json',
        body: json.encode(data));
    _isLoading = false;
    if (response.statusCode != 200 && response.statusCode != 201) {
      return null;
    }
    final Map<String, dynamic> responseData = json.decode(response.body);
    final String idGenerated = responseData["name"];
    print(idGenerated);
    return ItemDTO(id: idGenerated, itemName: itemName, createdBy: createdBy);
  }

  Widget _getItemWidget(BuildContext context, ItemDTO dto) {
    return Dismissible(
      key: Key(dto.id),
      background: Container(color: Colors.red),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[Expanded(child: Text(dto.itemName))]),
              Divider(),
            ],
          )),
      onDismissed: (DismissDirection direction) {
        removeItem(dto);
      },
    );
  }

  Widget _getAddWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.text,
                  decoration:
                      InputDecoration(labelText: 'Add to shopping List Item')),
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  Container(
                      padding: EdgeInsets.only(left: 2.0), child: Text('ADD'))
                ],
              ),
              onPressed: () {
                addItem(textController.text, "sanjsing").then((dto) {
                  setState(() {
                    if (dto != null) {
                      print("Calling Setstate: " + dto.toJson().toString());
                      widget.buyList.add(dto);
                    }
                  });
                });
                textController.clear();
              },
            ),
          ],
        ));
  }

  List<Widget> _getWidgetList(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_getAddWidget(context));
    widgetList.add(Divider());
    widget.buyList
        .forEach((dto) => widgetList.add(_getItemWidget(context, dto)));

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy List'),
      ),
      body: ListView(children: _getWidgetList(context)),
    );
  }
}
