main(List<String> args) {
  //define a String Buffer, StringBuffer is efficient way to concatenate
  StringBuffer buffer = StringBuffer();
  //Some variable to add to string buffer
  var itemName = "Headphone";
  int quantity = 1;
  //using write add varibles to string buffer
  buffer.write(itemName);
  buffer.write(quantity);
  //Concatenate multiple strings/Object.toString()
  buffer.writeAll([itemName, quantity]);
  //Interesting shortcut .. notation to call same method multiple times
  buffer
    ..writeln("Earphone")
    ..write(2);
  //print the output
  print(buffer);
}
