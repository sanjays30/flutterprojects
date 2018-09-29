
main(){
  aboutCollectionTypeList();
}

void aboutCollectionTypeList() {
  //List contains ordered list
  List orderList = new List();
  //multiple ways to instantiate list
  //List orderList2 = List();
  //List orderList3 = [];
  orderList.add('Kidle Paperwhite');
  orderList.add('Fire HD 10');
  print(orderList);

  //cascade notation
  orderList..add('Echo Dot')..add('Macbook Pro 15');
  print(orderList);
}

