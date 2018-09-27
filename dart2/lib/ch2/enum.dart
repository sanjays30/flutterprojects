main(List<String> args) {
  varAndConstant();

}
enum Status { 
  NEW, ASSIGNED, COMPLETED
  
  
  }

void varAndConstant() {
  var status = Status.ASSIGNED;
  Status.ASSIGNED.toString();
  const initialStatus = Status.NEW;
  print(status.runtimeType);
  print(' Initial Status ${initialStatus} and current status ${status}');
}
