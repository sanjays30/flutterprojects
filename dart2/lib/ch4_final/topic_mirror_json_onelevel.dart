import 'dart:mirrors';
import 'dart:convert';
import './model/order.dart';
/*
Reflection in Dart is based on the concept of mirrors, which are simply objects that 
reflect other objects. In a mirror-based API, whenever one wants to reflect on an entity, 
one must obtain a separate object called a mirror.
*/
main() {
  Order order = new Order('Headphone', 4);
  print(toJson(order));
}

String toJson(dynamic object) {
  InstanceMirror instanceMirror = reflect(object);
  ClassMirror instanceClassMirror = instanceMirror.type;
  Map<String, dynamic> jsonMap = {};
  reflectToMap(instanceClassMirror, instanceMirror, jsonMap);
  //a value that is not a number, boolean, string, null, list or a map  with string keys would need encodable
  return json.encode(jsonMap, toEncodable: (data) {
    if (data.runtimeType == DateTime) {
      return (data as DateTime).toIso8601String();
    } 
  });
}


reflectToMap(ClassMirror myClassMirror, InstanceMirror instanceMirror,
    Map<String, dynamic> jsonMap) {
  Iterable<DeclarationMirror> cmattr =
      myClassMirror.declarations.values.where((dm) => dm is VariableMirror);

  cmattr.forEach((DeclarationMirror mm) {
    String fieldName = MirrorSystem.getName(mm.simpleName);
    InstanceMirror fieldvalueMirror = instanceMirror.getField(mm.simpleName);
    var value = fieldvalueMirror.reflectee;
    if (value != null) {
      jsonMap[fieldName] = value;
    }
  });
  if (myClassMirror.superclass != null) {
    reflectToMap(myClassMirror.superclass, instanceMirror, jsonMap);
  }
}
