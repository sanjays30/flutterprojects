import 'dart:mirrors';
import 'dart:convert';
import './model/order.dart';
import './model/audit.dart';
import './model/customer.dart';

/*
Reflection in Dart is based on the concept of mirrors, which are simply objects that 
reflect other objects. In a mirror-based API, whenever one wants to reflect on an entity, 
one must obtain a separate object called a mirror.
*/
main() {
  AuditableOrder order = new AuditableOrder('Headphone', 4);
  Customer customer = Customer("VSHSHGSHGHJSHJSJHS", "user@email.com");
  order.customer = customer;
  print(toJson(order));
}

class AuditableOrder extends Order with Audit {
  Customer customer;
  AuditableOrder(itemName, quantity) : super(itemName, quantity) {}
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
      if (value.runtimeType == num ||
          value.runtimeType == DateTime ||
          value.runtimeType == int ||
          value.runtimeType == bool ||
          value.runtimeType == double ||
          value.runtimeType == String ||
          value.runtimeType == Map ||
          value.runtimeType == List) {
        jsonMap[fieldName] = value;
      } else {
        InstanceMirror instanceMirrorNested = reflect(value);
        Map<String, dynamic> nestedJsonMap = {};
        reflectToMap(
            instanceMirrorNested.type, instanceMirrorNested, nestedJsonMap);
        jsonMap[fieldName] = nestedJsonMap;
      }
    }
  });
  if (myClassMirror.superclass != null &&
      myClassMirror.superclass.reflectedType != Object) {
    print(myClassMirror.superclass);
    reflectToMap(myClassMirror.superclass, instanceMirror, jsonMap);
  }
}
