void main() {
  print("The area of the triangle is ${triangle(base: 10, height: 9)}");
}

double triangle({required double base, required double height}) {
  return double.parse(((base * height) / 2).toStringAsFixed(2));
}
