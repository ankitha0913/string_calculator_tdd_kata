void main(){
   add("//,\n0,-9,8,-1");
}

int add(String numbers){
  if(numbers.isEmpty) {
    return 0;
  }

  final multipleDelimitersPattern = RegExp(r'^//(\[.*?\])+\n');
  RegExp singleDelimiterPattern = RegExp(r'^//(.)\n');
  RegExp delimiterPattern = RegExp(r'[,\n]');

  if (multipleDelimitersPattern.hasMatch(numbers)) {
    final match = multipleDelimitersPattern.firstMatch(numbers)!;
    final delimiterSection = match.group(0)!;

    // Extract all delimiters inside brackets
    final delimiterRegex = RegExp(r'\[(.*?)\]');
    final delimiters = delimiterRegex
        .allMatches(delimiterSection)
        .map((m) => RegExp.escape(m.group(1)!))
        .toList();

    // Combine delimiters into one regex pattern
    delimiterPattern = RegExp(delimiters.join('|'));
    numbers = numbers.substring(match.end);
  } else if (singleDelimiterPattern.hasMatch(numbers)) {
    final match = singleDelimiterPattern.firstMatch(numbers)!;
    final delimiter = RegExp.escape(match.group(1)!);
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
