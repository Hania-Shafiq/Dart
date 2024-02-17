import 'dart:io';

void main() {
  print("This calculator can perform calculations on two numbers");

  print("Enter the operation you want to perform (add/subtract/multiply/divide): ");
  String? operator = stdin.readLineSync();

  if (operator != null) {
    operator = operator.toLowerCase();

    if (operator == 'add' || operator == 'subtract' || operator == 'multiply' || operator == 'divide') {
      num? a = null;
      num? b = null;

      while (a == null) {
        print("Enter the first number: ");
        a = num.tryParse(stdin.readLineSync()!);
        if (a == null) {
          print("Invalid input. Please enter a valid number.");
        }
      }

      while (b == null) {
        print("Enter the second number: ");
        b = num.tryParse(stdin.readLineSync()!);
        if (b == null) {
          print("Invalid input. Please enter a valid number.");
        }
      }

      num? result;

      if (operator == 'add') {
        result = add(a, b);
      } else if (operator == 'subtract') {
        result = subtract(a, b);
      } else if (operator == 'multiply') {
        result = multiply(a, b);
      } else if (operator == 'divide') {
        if (b != 0) {
          result = divide(a, b);
        } else {
          print("Cannot divide by zero.");
          return;
        }
      }

      print("Result: $result");
    } else {
      print("Invalid operation.");
    }
  }
}

num add(num a, num b) => a + b;

num multiply(num a, num b) => a * b;

num subtract(num a, num b) => a - b;

num divide(num a, num b) => a / b;
