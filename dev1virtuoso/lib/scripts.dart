import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

// General
class PasswordLockService {
  final LocalAuthentication _localAuth;
  final FlutterSecureStorage _secureStorage;

  PasswordLockService(this._localAuth, this._secureStorage);

  /// Authenticates the user using biometric, device password, or app-specific password.
  Future<bool> authenticate() async {
    try {
      bool authenticated = await _authenticateUsingBiometrics() ||
          await _authenticateUsingDevicePassword() ||
          await _authenticateUsingAppPassword();

      return authenticated;
    } catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }

  /// Attempts biometric authentication.
  Future<bool> _authenticateUsingBiometrics() async {
    return await _localAuth.authenticate(
      localizedReason: 'Authenticate to access the app',
      biometricOnly: false,
    );
  }

  /// Attempts device password authentication.
  Future<bool> _authenticateUsingDevicePassword() async {
    String devicePassword = await _secureStorage.read(key: 'devicePassword');

    // Implement device-specific password validation logic here
    return true;
  
    return false;
  }

  /// Attempts app-specific password authentication.
  Future<bool> _authenticateUsingAppPassword() async {
    String storedPassword = await _secureStorage.read(key: 'appPassword');
    String hashedPassword = sha256
        .convert(utf8.encode('your_custom_salt' 'desired_password'))
        .toString();

    return storedPassword == hashedPassword;
  }

  /// Stores the app-specific password securely.
  Future<void> storeAppPassword(String password) async {
    String hashedPassword = _hashPassword(password);
    await _secureStorage.write(key: 'appPassword', value: hashedPassword);
  }

  /// Hashes the password using a secure algorithm.
  String _hashPassword(String password) {
    // Use a secure hashing algorithm like bcrypt for better password security
    return sha256
        .convert(utf8.encode('your_custom_salt$password'))
        .toString();
  }
}

// Arcade
void threeLevelGame() {
  int score = 0;

  print('Welcome to the Three Levels Game!');

  // Level 1
  print('Level 1: Answer the following question to proceed to the next level.');
  print('What is the capital of France?');
  String answer1 = stdin.readLineSync() ?? '';
  if (answer1.toLowerCase() == 'paris') {
    print('Correct answer! You have passed Level 1.');
    score++;
  } else {
    print('Incorrect answer. Game over!');
    print('Final Score: $score');
    return;
  }

  // Level 2
  print(
      '\nLevel 2: Answer the following question to proceed to the final level.');
  print('How many continents are there in the world?');
  String answer2 = stdin.readLineSync() ?? '';
  if (answer2 == '7') {
    print('Correct answer! You have passed Level 2.');
    score++;
  } else {
    print('Incorrect answer. Game over!');
    print('Final Score: $score');
    return;
  }

  // Level 3
  print('\nFinal Level: Answer the following question to complete the game.');
  print('What is the capital of Japan?');
  String answer3 = stdin.readLineSync() ?? '';
  if (answer3.toLowerCase() == 'tokyo') {
    print('Congratulations! You have successfully completed the game.');
    score++;
  } else {
    print('Incorrect answer. Game over!');
  }

  print('Final Score: $score');
}

List<String> board = List.filled(9, ' ');

void ticTacToe() {
  print('Welcome to Tic-Tac-Toe!');
  print(
      'To make a move, enter a number from 1 to 9 based on the following board layout:');
  displayBoard();

  bool playerX = true; // Player X starts
  bool gameEnd = false;

  while (!gameEnd) {
    int move = int.parse(stdin.readLineSync() ?? '0');
    if (move < 1 || move > 9 || board[move - 1] != ' ') {
      print('Invalid move. Try again.');
      continue;
    }

    board[move - 1] = playerX ? 'X' : 'O';
    displayBoard();

    if (checkWin(playerX ? 'X' : 'O')) {
      print('Player ${playerX ? 'X' : 'O'} wins!');
      gameEnd = true;
    } else if (board.every((element) => element != ' ')) {
      print('It\'s a draw!');
      gameEnd = true;
    }

    playerX = !playerX;
  }
}

void displayBoard() {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('-----------');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('-----------');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

bool checkWin(String player) {
  // Check rows
  for (int i = 0; i < 3; i++) {
    if (board[i * 3] == player &&
        board[i * 3 + 1] == player &&
        board[i * 3 + 2] == player) {
      return true;
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[i] == player &&
        board[i + 3] == player &&
        board[i + 6] == player) {
      return true;
    }
  }

  // Check diagonals
  if ((board[0] == player && board[4] == player && board[8] == player) ||
      (board[2] == player && board[4] == player && board[6] == player)) {
    return true;
  }

  return false;
}

const int width = 20;
const int height = 20;
const List<int> directions = [-width, 1, width, -1]; // Up, Right, Down, Left

List<int> snake = [44, 45]; // Initial snake position
int food = 33; // Initial food position
int direction = 1; // Initial direction (Right)
bool gameover = false;

void snakeGame() {
  stdout.writeln('Welcome to Snake Game! Use W/A/S/D to control the snake.');

  stdin.echoMode = false;
  stdin.lineMode = false;

  draw();

  stdin.asBroadcastStream().listen((event) {
    switch (event) {
      case 119: // W - Up
        if (direction != 2) direction = 0;
        break;
      case 100: // D - Right
        if (direction != 3) direction = 1;
        break;
      case 115: // S - Down
        if (direction != 0) direction = 2;
        break;
      case 97: // A - Left
        if (direction != 1) direction = 3;
        break;
    }
  });

  Timer.periodic(const Duration(milliseconds: 200), (timer) {
    if (gameover) {
      timer.cancel();
      stdout.writeln('Game Over! Your score: ${snake.length - 2}');
      exit(0);
    }

    move();
    draw();
  });
}

void draw() {
  stdout.write('\x1B[2J\x1B[0;0H'); // Clear the console

  for (int i = 0; i < width * height; i++) {
    if (i % width == 0) stdout.write('\n');

    if (i == food) {
      stdout.write('F');
    } else if (snake.contains(i)) {
      stdout.write('O');
    } else {
      stdout.write('.');
    }
  }
}

void move() {
  int newHead = snake.first + directions[direction];

  if (newHead < 0 || newHead >= width * height || snake.contains(newHead)) {
    gameover = true;
    return;
  }

  snake.insert(0, newHead);

  if (newHead == food) {
    // Generate new food
    food = (DateTime.now().microsecondsSinceEpoch % (width * height)).abs();
  } else {
    snake.removeLast();
  }
}

// Setting
class SettingsList extends StatelessWidget {
  final bool notificationsEnabled;
  final bool isDarkMode;
  final bool anonymousFeedbackEnabled;
  final bool developerOptionsEnabled;
  final double textSize;
  final bool colorBlindModeEnabled;
  final bool elderlyModeEnabled;
  final bool boldTextEnabled;
  final Function(bool) toggleNotifications;
  final Function(bool) toggleDarkMode;
  final Function(bool) toggleAnonymousFeedback;
  final Function(bool) toggleDeveloperOptions;
  final Function(double) updateTextSize;
  final Function(bool) toggleColorBlindMode;
  final Function(bool) toggleElderlyMode;
  final Function(bool) toggleBoldText;

  const SettingsList({Key? key, 
    required this.notificationsEnabled,
    required this.isDarkMode,
    required this.anonymousFeedbackEnabled,
    required this.developerOptionsEnabled,
    required this.textSize,
    required this.colorBlindModeEnabled,
    required this.elderlyModeEnabled,
    required this.boldTextEnabled,
    required this.toggleNotifications,
    required this.toggleDarkMode,
    required this.toggleAnonymousFeedback,
    required this.toggleDeveloperOptions,
    required this.updateTextSize,
    required this.toggleColorBlindMode,
    required this.toggleElderlyMode,
    required this.toggleBoldText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Notifications'),
          value: notificationsEnabled,
          onChanged: toggleNotifications,
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: isDarkMode,
          onChanged: toggleDarkMode,
        ),
        SwitchListTile(
          title: const Text('Anonymous Feedback'),
          value: anonymousFeedbackEnabled,
          onChanged: toggleAnonymousFeedback,
        ),
        SwitchListTile(
          title: const Text('Developer Options'),
          value: developerOptionsEnabled,
          onChanged: toggleDeveloperOptions,
        ),
        Slider(
          value: textSize,
          min: 10.0,
          max: 20.0,
          onChanged: updateTextSize,
        ),
        SwitchListTile(
          title: const Text('Color Blind Mode'),
          value: colorBlindModeEnabled,
          onChanged: toggleColorBlindMode,
        ),
        SwitchListTile(
          title: const Text('Elderly Mode'),
          value: elderlyModeEnabled,
          onChanged: toggleElderlyMode,
        ),
        SwitchListTile(
          title: const Text('Bold Text'),
          value: boldTextEnabled,
          onChanged: toggleBoldText,
        ),
      ],
    );
  }
}

// Utility
class PiCalculator {
  int pointsInsideCircle = 0;
  double piValue = 0.0;
  int progress = 0;
  int maxTimeInSeconds = 5;
  int elapsedTimeInSeconds = 0;
  bool isCalculating = true;

  void updatePiValue() {
    piValue = 4 * pointsInsideCircle / maxTimeInSeconds;
    progress = pointsInsideCircle * 100 ~/ maxTimeInSeconds;
  }

  void startCalculation(Function setState) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (elapsedTimeInSeconds >= maxTimeInSeconds) {
        timer.cancel();
        isCalculating = false;
        // Add code to display calculation completion message
      } else {
        if (isCalculating) {
          elapsedTimeInSeconds++;
          double x = Random().nextDouble();
          double y = Random().nextDouble();
          if (x * x + y * y <= 1) {
            pointsInsideCircle++;
          }
          updatePiValue();
          setState();
        }
      }
    });
  }
}

// Morse Code Dictionary
Map<String, String> morseCodeMap = {
  'A': '.-',
  'B': '-...',
  'C': '-.-.',
  'D': '-..',
  'E': '.',
  'F': '..-.',
  'G': '--.',
  'H': '....',
  'I': '..',
  'J': '.---',
  'K': '-.-',
  'L': '.-..',
  'M': '--',
  'N': '-.',
  'O': '---',
  'P': '.--.',
  'Q': '--.-',
  'R': '.-.',
  'S': '...',
  'T': '-',
  'U': '..-',
  'V': '...-',
  'W': '.--',
  'X': '-..-',
  'Y': '-.--',
  'Z': '--..',
  '1': '.----',
  '2': '..---',
  '3': '...--',
  '4': '....-',
  '5': '.....',
  '6': '-....',
  '7': '--...',
  '8': '---..',
  '9': '----.',
  '0': '-----',
  ' ': ' '
};

// Function to translate text to Morse code
String textToMorseCode(String text) {
  List<String> words = text.toUpperCase().split(' ');
  List<String> morseCodeList = [];

  for (String word in words) {
    List<String> chars = word.split('');
    List<String> morseChars =
        chars.map((char) => morseCodeMap[char] ?? '').toList();
    String morseWord = morseChars.join(' ');
    morseCodeList.add(morseWord);
  }

  return morseCodeList.join(' / ');
}

// Function to translate Morse code to text
String morseCodeToText(String morseCode) {
  List<String> morseWords = morseCode.split(' / ');
  List<String> textList = [];

  for (String morseWord in morseWords) {
    List<String> morseChars = morseWord.split(' ');
    List<String> chars = morseChars
        .map((morseChar) => morseCodeMap.entries
            .firstWhere((entry) => entry.value == morseChar,
                orElse: () => const MapEntry('', ''))
            .key)
        .toList();
    String word = chars.join('');
    textList.add(word);
  }

  return textList.join(' ');
}

String generateRandomPassword(int length) {
  const String letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numbers = '0123456789';
  const String specialCharacters = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

  String allChars = letters + numbers + specialCharacters;
  Random random = Random();
  String password = '';

  for (int i = 0; i < length; i++) {
    int randomIndex = random.nextInt(allChars.length);
    password += allChars[randomIndex];
  }

  return password;
}

void mindCheck() {
  // GAD-7 Questions
  List<String> gadQuestions = [
    'Feeling nervous, anxious, or on edge?',
    'Not being able to stop or control worrying?',
    'Worrying too much about different things?',
    'Trouble relaxing?',
    'Being so restless that it is hard to sit still?',
    'Becoming easily annoyed or irritable?',
    'Feeling afraid as if something awful might happen?'
  ];

  // PHQ-9 Questions
  List<String> phqQuestions = [
    'Little interest or pleasure in doing things?',
    'Feeling down, depressed, or hopeless?',
    'Trouble falling or staying asleep, or sleeping too much?',
    'Feeling tired or having little energy?',
    'Poor appetite or overeating?',
    'Feeling bad about yourself — or that you are a failure or have let yourself or your family down?',
    'Trouble concentrating on things, such as reading the newspaper or watching television?',
    'Moving or speaking so slowly that other people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual?',
    'Thoughts that you would be better off dead or of hurting yourself in some way?'
  ];

  int gadScore = 0;
  int phqScore = 0;

  // Ask GAD-7 Questions
  print(
      'Please answer the following questions for GAD-7 (0 - Not at all, 1 - Several days, 2 - More than half the days, 3 - Nearly every day):');
  for (int i = 0; i < gadQuestions.length; i++) {
    stdout.write('${i + 1}. ${gadQuestions[i]} ');
    int response = int.parse(stdin.readLineSync() ?? '0');
    gadScore += response;
  }

  // Ask PHQ-9 Questions
  print(
      'Please answer the following questions for PHQ-9 (0 - Not at all, 1 - Several days, 2 - More than half the days, 3 - Nearly every day):');
  for (int i = 0; i < phqQuestions.length; i++) {
    stdout.write('${i + 1}. ${phqQuestions[i]} ');
    int response = int.parse(stdin.readLineSync() ?? '0');
    phqScore += response;
  }

  // Display Scores
  print('\nGAD-7 Score: $gadScore');
  print('PHQ-9 Score: $phqScore');
}

void scientificCalculator() {
  bool isRunning = true;

  while (isRunning) {
    print(
        'Enter an expression (e.g., 5 + 3, sqrt(9), sin(0.5), log(10)) or "exit" to quit:');
    String input = stdin.readLineSync() ?? '';

    if (input.toLowerCase() == 'exit') {
      isRunning = false;
      print('Calculator has been closed.');
    } else {
      try {
        dynamic result = calculateExpression(input);
        print('Result: $result');
      } catch (e) {
        print('Error: $e');
      }
    }
  }
}

dynamic calculateExpression(String input) {
  input = input.replaceAll(' ', ''); // Remove whitespace
  if (input.contains('+')) {
    List<String> parts = input.split('+');
    return double.parse(parts[0]) + double.parse(parts[1]);
  } else if (input.contains('-')) {
    List<String> parts = input.split('-');
    return double.parse(parts[0]) - double.parse(parts[1]);
  } else if (input.contains('*')) {
    List<String> parts = input.split('*');
    return double.parse(parts[0]) * double.parse(parts[1]);
  } else if (input.contains('/')) {
    List<String> parts = input.split('/');
    return double.parse(parts[0]) / double.parse(parts[1]);
  } else if (input.contains('sqrt')) {
    double number = double.parse(input.substring(5, input.length - 1));
    return sqrt(number);
  } else if (input.contains('sin')) {
    double angle = double.parse(input.substring(4, input.length - 1));
    return sin(angle);
  } else if (input.contains('cos')) {
    double angle = double.parse(input.substring(4, input.length - 1));
    return cos(angle);
  } else if (input.contains('tan')) {
    double angle = double.parse(input.substring(4, input.length - 1));
    return tan(angle);
  } else if (input.contains('log')) {
    double value = double.parse(input.substring(4, input.length - 1));
    return log(value);
  } else {
    throw 'Invalid expression';
  }
}

void bMICalculator() {
  print('Welcome to the BMI Calculator!');
  print(
      'Please choose the unit system: 1 for metric (kg/m) or 2 for imperial (lbs/in)');
  int unitChoice = int.parse(stdin.readLineSync() ?? '0');

  if (unitChoice == 1) {
    calculateMetricBMI();
  } else if (unitChoice == 2) {
    calculateImperialBMI();
  } else {
    print('Invalid choice. Please run the program again.');
  }
}

void calculateMetricBMI() {
  print('Please enter your weight in kilograms:');
  double weight = double.parse(stdin.readLineSync() ?? '0');

  print('Please enter your height in meters:');
  double height = double.parse(stdin.readLineSync() ?? '0');

  double bmi = calculateBMI(weight, height);
  print('Your BMI is: $bmi');
}

void calculateImperialBMI() {
  print('Please enter your weight in pounds:');
  double weight = double.parse(stdin.readLineSync() ?? '0');

  print('Please enter your height in inches:');
  double height = double.parse(stdin.readLineSync() ?? '0');

  double bmi = (weight / (height * height)) * 703;
  print('Your BMI is: $bmi');
}

double calculateBMI(double weight, double height) {
  return weight / (height * height);
}
