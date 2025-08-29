void main(){
   print(add("0"));
}

int add(String numbers){
  if(numbers.isEmpty) {
    return 0;
  }

  RegExp customDelimiterPattern = RegExp(r'^//(.)\n');
  RegExp delimiterPattern = RegExp(r'[,\n]');

  if (customDelimiterPattern.hasMatch(numbers)) {
    final match = customDelimiterPattern.firstMatch(numbers);
    delimiterPattern = RegExp(RegExp.escape(match!.group(1)!));
    numbers = numbers.substring(match.end);
  }

  return numbers
      .split(delimiterPattern)
      .map(int.parse)
      .reduce((a, b) => a + b);

}
