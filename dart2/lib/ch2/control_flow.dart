main(List<String> args) {
  bool expediteShipping = false;
  DateTime orderDate = DateTime.now();
  DateTime shippingDate;

  //if else
  if (expediteShipping) {
    shippingDate = orderDate.add(Duration(days: 2));
  } else {
    shippingDate = orderDate.add(Duration(days: 5));
  }
  //short version
  shippingDate = expediteShipping
      ? orderDate.add(Duration(days: 2))
      : orderDate.add(Duration(days: 5));

  print('orderDate: ${orderDate}');
  print('orderDate: ${shippingDate}');

  //Get a collection
  List<String> items = [
    'Kidle Paperwhite',
    'Fire HD 10',
    'Macbook Pro 15',
    'Echo Dot'
  ];

  //for loop on iterable
  for (var item in items) {
    print(item);
  }

  //for loop with index
  for (var index = 1; index < items.length; index++) {
    print(items.elementAt(index));
  }

  //While loop
  var year = 2001;
  while (year < 2018) {
    year += 1;
  }
  //do while
  do {
    year = year + 1;
  } while (year < 2020);

  //Switch statements in Dart compare integer, string, or compile-time constants, enum
  var status = 'NEW';
  switch (status) {
    case 'NEW':
      print(status);
      break;
    case 'OPEN':
      print(status);
      break;
    default:
      print(status);
  }
}