import 'dart:mirrors';
import 'package:meta/meta.dart';

/*
Reflection in Dart is based on the concept of mirrors, which are simply objects that 
reflect other objects. In a mirror-based API, whenever one wants to reflect on an entity, 
one must obtain a separate object called a mirror.
*/
main() {
  Order order = new Order('Headphone', 4);
  //aboutInstanceMirror(order);
  //aboutClassMirror(Order);
  toJson(order);
}

String toJson(dynamic object) {
  InstanceMirror instanceMirror = reflect(object);

  ClassMirror MyClassMirror = instanceMirror.type;

  Iterable<DeclarationMirror> attr =
      MyClassMirror.declarations.values.where((dm) => dm is VariableMirror);

  StringBuffer sb = new StringBuffer('{');
  bool firstLoop = true;
  attr.forEach((DeclarationMirror mm) {
    String fieldName = MirrorSystem.getName(mm.simpleName);
    InstanceMirror fieldvalueMirror = instanceMirror.getField(mm.simpleName);
    Type type = fieldvalueMirror.reflectee.runtimeType;
    print(type);

    if (fieldvalueMirror.reflectee != null) {
      if (firstLoop) {
        firstLoop = false;
      } else {
        sb.write(', ');
      }
      sb.write('"');
      sb.write(fieldName);
      sb.write('"');

      sb.write(': ');
      switch (type) {
        case String:
          sb.write('"');
          sb.write(fieldvalueMirror.reflectee);
          sb.write('"');
          break;
        case DateTime:
          sb.write('"');
          sb.write(toString(fieldvalueMirror.reflectee as DateTime));
          sb.write('"');
          break;
        default:
          sb.write(fieldvalueMirror.reflectee);
      }
    }
  });
  sb.writeln('}');
  print(sb.toString());
  return sb.toString();
}

toString(DateTime dt) {
  return dt.toIso8601String();
}

class Order {
  String itemName;
  int quantity;
  double price = 0.0;
  bool expediteShipping = false;
  DateTime orderDate = DateTime.now();

  Order(this.itemName, [this.quantity]) : super() {}
  Order.withName({@required this.itemName, this.quantity, this.price}) {}

  @override
  String toString() {
    return itemName;
  }
}
