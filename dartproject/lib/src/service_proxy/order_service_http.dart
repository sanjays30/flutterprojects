import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/order.dart';
import '../service_proxy/authenticator_fb.dart';

/// Firebase real time datanase
class OrderServiceFbrtd {
 
  // Then show a snackbar!
  Future<bool> removeItem(Order dto) async {
    Authenticator auth = Authenticator();
    var result = await auth.authenticate("sanjays30@gmail.com", "asdfgh");
    var idToken = result.idToken;

    final http.Response response = await http.delete(
        'https://flutter-sks.firebaseio.com/orders/${dto.id}.json?auth=${idToken}');
    if (response.statusCode != 200 && response.statusCode != 202) {
      return false;
    }
    return true;
  }

  Future<List<Order>> fetchAllItems() async {
    Authenticator auth = Authenticator();
    var result = await auth.authenticate("sanjays30@gmail.com", "asdfgh");
    var idToken = result.idToken;
    final http.Response response = await http
        .get('https://flutter-sks.firebaseio.com/orders.json?auth=${idToken}');
        
    final Map<String, dynamic> orderListDataMap = json.decode(response.body);

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(
          'http Status: ${response.statusCode}, Message: ${response.reasonPhrase}');
    }
    List<Order> list = [];
    orderListDataMap.forEach((key, json) {
      Order order = Order.fromJson(json);
      order.id = key;
      list.add(order);
    });

    return list;
  }

  Future<Order> addItem(Order data) async {
    Authenticator auth = Authenticator();
    var result = await auth.authenticate("sanjays30@gmail.com", "asdfgh");
    var idToken = result.idToken;

    final http.Response response = await http.post(
        'https://flutter-sks.firebaseio.com/orders.json?auth=${idToken}',
        body: json.encode(data.toJson()));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(
          'http Status: ${response.statusCode}, Message: ${response.reasonPhrase}');
    }
    final Map<String, dynamic> responseData = json.decode(response.body);
    final String idGenerated = responseData["name"];
    data.id = idGenerated;
    return data;
  }
}
