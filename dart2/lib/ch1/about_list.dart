
main(){
  aboutCollectionTypeList();
}

void aboutCollectionTypeList() {
  //List contains ordered list
  List orderList = new List();
  //multiple ways to instantiate list
  //List orderList2 = List();
  //List orderList3 = [];
  orderList.add("headphone");
  orderList.add("cellohone");
  print(orderList);

  orderList..add("headphone")..add("cellohone");
  print(orderList);
}

