
import 'package:firebase/firebase_io.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user.dart';
import '../service_proxy/authenticator_fb.dart';

class OrderServiceFbfs {
  void getOrders() {
    Authenticator auth = Authenticator();
    auth.authenticate("sanjays30@gmail.com", "asdfgh").then((result) {
      var credential =
          result.idToken; // Retrieve auth credential
      var fbClient = FirebaseClient(credential);

      var path =
          "https://firestore.googleapis.com/v1beta1/projects/ng-firestore-sks/databases/(default)/documents/orders";
      fbClient.get(path)
      .then((response)=>print(response))
      .catchError((onError)=> print(onError));
     
    });

    // DELETE
    //await fbClient.delete(path);
  }
}
