main(List<String> args) {
  var status = "ASSIGNED";
  const initialStatus = "NEW";
  //constant cannot be reassigned a value
  print(status.runtimeType);
  print(' Initial Status ${initialStatus} and current status ${status}');
}
