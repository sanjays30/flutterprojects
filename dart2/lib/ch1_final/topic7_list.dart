//collection type list
main(){
  //List contains ordered list
  List orderList = new List();
  //multiple ways to instantiate list
  //List orderList2 = List();
  //List orderList3 = [];
  orderList.add('Kidle Paperwhite');
  orderList.add('Fire HD 10');
  print(orderList);

  //use cascade notation to add more items
  orderList..add('Echo Dot')..add('Macbook Pro 15');
  print(orderList);
}

