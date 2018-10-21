//Create a custom class Distance
//create main and try + on class
//Show how to add operator
//Show greater than operator
main(List<String> args) {
  var d1 = Distance(1);
  var d2 = Distance(2);
  var d3 = d1 + d2;
  print(d3);
  print(d1 > d2);
}

class Distance {
  int meter;
  Distance(int meter) {
    this.meter = meter;
  }

  @override
  String toString() {
    return 'meter: ${meter}';
  }

  Distance operator +(Distance dis) {
    return Distance((this.meter + dis.meter));
  }

  bool operator >(Distance dis) {
    return this.meter > dis.meter;
  }
}
