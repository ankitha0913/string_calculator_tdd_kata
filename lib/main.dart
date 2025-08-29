void main(){
   print(add("//,\n0,-9,8,-1"));
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

  final parsedNumbers = numbers.split(delimiterPattern).map(int.parse).toList();

  final negatives = parsedNumbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('negative numbers not allowed ${negatives.join(',')}');
  }

  return parsedNumbers
      .reduce((a, b) => a + b);

}
