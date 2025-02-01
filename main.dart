/// The main entry point of the application.
void main() {
  print("The area of the triangle is ${triangle(base: 10, height: 9)}");
}

/// Calculates the area of a triangle given its base and height.
///
/// Args:
///   base (double): The base of the triangle.
///
///   height (double): The height of the triangle.
///
/// Returns:
///   double: The area of the triangle.
double triangle({required double base, required double height}) {
  return double.parse(((base * height) / 2).toStringAsFixed(2));
}
