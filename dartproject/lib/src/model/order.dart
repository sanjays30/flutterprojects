import 'package:meta/meta.dart';
import './status.dart';

class Order {
  String id;
  String itemName;
  int quantity;
  double price;
  double discount;
  bool expediteShipping;
  DateTime orderDate;
  DateTime shippingDate;
  Status status;

  Order(
      {@required this.itemName,
      this.id,
      this.quantity=1,
      this.price=10.0,
      this.discount=19.0,
      this.expediteShipping=true,
      this.orderDate,
      this.shippingDate,
      this.status=Status.NEW}) {
        if(shippingDate==null){
          this.shippingDate = DateTime.now();
        }
        this.orderDate = DateTime.now();
        
      }

  Order.fromJson(Map<String, dynamic> jsonMap) {
    itemName = jsonMap['itemName'];
    quantity = jsonMap['quantity'];
    price = jsonMap['price'];
    discount = jsonMap['discount'];
    expediteShipping = jsonMap['expediteShipping'];
    orderDate = jsonMap['orderDate']!=null?DateTime.parse(jsonMap['orderDate']):null;
    shippingDate = jsonMap['shippingDate']!=null?DateTime.parse(jsonMap['shippingDate']):null ;
    status = StatusUtil.valueOf(jsonMap['status']);
  }
  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'quantity': quantity,
      'price': price,
      'discount': discount,
      'expediteShipping': expediteShipping,
      'orderDate': orderDate!=null?orderDate.toIso8601String():null,
      'shippingDate': shippingDate!=null?shippingDate.toIso8601String():null ,
      'status': StatusUtil.statusToString(status),
    };
  }

  @override
  String toString() {
    Map<String, dynamic> map = toJson();
    map['id']=id;
    return map.toString();
  }
}
