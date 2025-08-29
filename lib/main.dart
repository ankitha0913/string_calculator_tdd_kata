void main(){
   print(add("//,\n0,-9,8,-1"));
}

int add(String numbers){
  if(numbers.isEmpty) {
    return 0;
  }

  RegExp multiDelimiterPattern = RegExp(r'^//\[(.+)\]\n');
  RegExp singleDelimiterPattern = RegExp(r'^//(.)\n');
  RegExp delimiterPattern = RegExp(r'[,\n]');

  RegExpMatch? match; //Following DRY principle here
  if ((match = multiDelimiterPattern.firstMatch(numbers)) != null ||
      (match = singleDelimiterPattern.firstMatch(numbers)) != null) {
    final delimiter = RegExp.escape(match!.group(1)!);
    delimiterPattern = RegExp(delimiter);
    numbers = numbers.substring(match.end);
  }

  final parsedNumbers = numbers.split(delimiterPattern).map(int.parse).toList().where((n) => n <= 1000);

  final negatives = parsedNumbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('negative numbers not allowed ${negatives.join(',')}');
  }

  return parsedNumbers
      .reduce((a, b) => a + b);

}
