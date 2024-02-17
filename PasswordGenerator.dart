import 'dart:io';
import 'dart:math';

void main() {
  int no_passwords;
  int len_numbers;
  int len_lowercase_alphabets;
  int len_uppercase_alphabets;
  int len_special_characters;

  try {
    print("Welcome to the strong password generator");
    print("How many passwords do you want?:");
    no_passwords = int.parse(stdin.readLineSync()!);
    print("How many numbers letters do you want?:");
    len_numbers = int.parse(stdin.readLineSync()!);
    print("How many lowercase letters do you want?:");
    len_lowercase_alphabets = int.parse(stdin.readLineSync()!);
    print("How many uppercase letters do you want?:");
    len_uppercase_alphabets = int.parse(stdin.readLineSync()!);
    print("How many special_characters letters do you want?:");
    len_special_characters = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print(e);
    print("Try to enter a valid number");
    return;
  }

  List<String> generatedPasswords = generate_password(
      no_passwords,
      len_numbers,
      len_lowercase_alphabets,
      len_uppercase_alphabets,
      len_special_characters);

  // Print each generated password on a separate line
  for (String password in generatedPasswords) {
    print(password);
  }
}

List<String> generate_password(
    int no_passwords,
    int len_numbers,
    int len_lowercase_alphabets,
    int len_uppercase_alphabets,
    int len_special_characters) {
  String numbers = "123456789";
  String lowercase_alphabets = "qwertyuiopasdfghjklzxcvbnm";
  String uppercase_alphabets = "QWERTYUIOPASDFGHJKLZMXNCBV";
  String special_characters = "!@#\$%^&*|?><";

  List<String> generatedPasswords = [];

  Random rand = Random();
  for (int i = 0; i < no_passwords; i++) {
    String password = "";

    for (int i = 0; i < len_lowercase_alphabets; i++) {
      int randomIndex = rand.nextInt(lowercase_alphabets.length);
      String randomCharacter = lowercase_alphabets[randomIndex];
      password = randomCharacter + password;
    }

    for (int i = 0; i < len_uppercase_alphabets; i++) {
      int randomIndex = rand.nextInt(uppercase_alphabets.length);
      String randomCharacter = uppercase_alphabets[randomIndex];
      password = randomCharacter + password;
    }

    for (int i = 0; i < len_numbers; i++) {
      int randomIndex = rand.nextInt(numbers.length);
      String randomCharacter = numbers[randomIndex];
      password = randomCharacter + password;
    }

    for (int i = 0; i < len_special_characters; i++) {
      int randomIndex = rand.nextInt(special_characters.length);
      String randomCharacter = special_characters[randomIndex];
      password = randomCharacter + password;
    }

    generatedPasswords.add(password);
  }

  return generatedPasswords;
}

