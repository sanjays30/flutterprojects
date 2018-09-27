main(List<String> args) {
  aboutStringBuffer();
}
void aboutStringBuffer() {
  var itemName="Headphone";
  int quantity=1;
  //StringBuffer is efficient way to concatenate
  StringBuffer buffer = StringBuffer();
  buffer.write(itemName);
  buffer.write(quantity);
  //Concatenate multiple strings/Object.toString()
  buffer.writeAll([itemName, quantity]);
  //Interesting shortcut to call same method multiple times
  buffer..writeln("Earphone")..write(2);
  print(buffer);
}
