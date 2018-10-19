main(List<String> args) {
  //Variable can be declared wit var keyword
  var status = 'ASSIGNED';
  //dart can infer type from assignment
  print(status.runtimeType);
  //vriables can be reassigned values
  status = 'SHIPPED';
  //You can define constants, value must be assiged
  const initialStatus = 'NEW';
  print(initialStatus.runtimeType);
  //constant cannot be reassigned another value
}
