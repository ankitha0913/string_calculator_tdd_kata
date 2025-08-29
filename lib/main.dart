void main(){
   print(add("0"));
}

int add(String numbers){
  if(numbers.isEmpty) {
    return 0;
  }
  return numbers.split(",").map(int.parse).reduce((a, b) => a + b);
}
