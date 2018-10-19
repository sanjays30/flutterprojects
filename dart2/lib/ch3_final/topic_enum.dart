main(List<String> args) {
  varAndConstant();
}

enum Status { NEW, ASSIGNED, COMPLETED }

void varAndConstant() {
  const initialStatus = Status.NEW;

  var status = Status.ASSIGNED;

  print(status.runtimeType);
  print(' Initial Status ${initialStatus} and current status ${status}');
}
