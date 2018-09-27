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
  //printAllFieldNames(order); 
  //printAllMethodNames(order);
  aboutClassMirrorFromObject(order);
}

aboutInstanceMirror(dynamic object) {
  print('*******aboutInstanceMirror*******');
  //instance mirror can be used to call methods
  InstanceMirror myClassInstanceMirror = reflect(object);
  if (myClassInstanceMirror.reflectee is Order) {
    String itemName = (myClassInstanceMirror.reflectee as Order).itemName;
    print(itemName);
  }
  //calling a method
  InstanceMirror resultMirror = myClassInstanceMirror.invoke(#toString, []);
  print(resultMirror.reflectee);
}

aboutClassMirror(Type classType) {
  print('********aboutClassMirror*********');
  //class mirror can be used to inspect class
  ClassMirror MyClassMirror = reflectClass(classType);
  for (var memebr in MyClassMirror.declarations.values) {
    print(MirrorSystem.getName(memebr.simpleName));
  }
}

aboutClassMirrorFromObject(dynamic object) {
  //class mirror can be used to inspect class
  print('*******aboutClassMirrorFromObject*******');
  ClassMirror MyClassMirror = reflect(object).type;
  for (var member in MyClassMirror.declarations.values) {
    print(MirrorSystem.getName(member.simpleName));
  }
}

printAllMethodNames(dynamic object) {
  InstanceMirror instanceMirror = reflect(object);

  ClassMirror MyClassMirror = instanceMirror.type;

  Iterable<DeclarationMirror> decls = MyClassMirror.declarations.values
      .where((dm) => dm is MethodMirror && dm.isRegularMethod);
  decls.forEach((DeclarationMirror mm) {
    print(MirrorSystem.getName(mm.simpleName));
  });
}

printAllFieldNames(dynamic object) {
  InstanceMirror instanceMirror = reflect(object);

  ClassMirror MyClassMirror = instanceMirror.type;

  Iterable<DeclarationMirror> attr =
      MyClassMirror.declarations.values.where((dm) => dm is VariableMirror);
  attr.forEach((DeclarationMirror mm) {
    String fieldName = MirrorSystem.getName(mm.simpleName);

    print(fieldName);
  });
}

class Order {
  var itemName;
  int quantity;
  double price;
  bool expediteShipping;
  DateTime orderDate = DateTime.now();
  DateTime get shippingDate {
    return orderDate.add(Duration(days: 5));
  }
  set shippingDate(DateTime date){
    print(date);
  }
  
  Order(this.itemName, [this.quantity]) : super() {}
  Order.withName({@required this.itemName, this.quantity, this.price}) {}

  @override
  String toString() {
    return itemName;
  }
}
