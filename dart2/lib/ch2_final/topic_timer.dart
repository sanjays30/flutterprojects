import 'dart:async';

main(List<String> args) {
  //How to build map from data in file
  Timer(Duration(seconds: 1), () => print('timer'));
  print('end of main');
}

tickTimer() {
  Timer.periodic(Duration(seconds: 1), (Timer timer) {
    print(timer.tick);
  });
}
