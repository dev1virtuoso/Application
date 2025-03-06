import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Utility {
  String title;
  String summary;
  dynamic content;

  Utility({
    required this.title,
    required this.summary,
    required this.content,
  });
}

class UtilityCard extends StatelessWidget {
  final Utility utility;

  const UtilityCard({Key? key, required this.utility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              utility.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              utility.summary,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            if (utility.content is Widget) ...[
              utility.content
            ] else ...[
              Text(
                utility.content.toString(),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class CardDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    List<Utility> utilities = [
      Utility(
        title: t.utility1Title,
        summary: t.utility1Summary,
        content: t.utility1Context,
      ),
      Utility(
        title: t.utility2Title,
        summary: t.utility2Summary,
        content: t.utility2Context,
      ),
      Utility(
        title: t.utility3Title,
        summary: t.utility3Summary,
        content: Container(
          height: 400, // Set a fixed height for the PiCalculatorScreen
          child: RandomCodeGeneratorScreen(),
        ),
      ),
      Utility(
        title: t.utility4Title,
        summary: t.utility4Summary,
        content: Container(
          height: 500, // Set a fixed height for the PiCalculatorScreen
          child: PiCalculatorScreen(),
        ),
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: utilities.length,
      itemBuilder: (context, index) {
        return UtilityCard(utility: utilities[index]);
      },
    );
  }
}

class PiCalculatorScreen extends StatefulWidget {
  @override
  _PiCalculatorScreenState createState() => _PiCalculatorScreenState();
}

class _PiCalculatorScreenState extends State<PiCalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  bool _isCalculating = false;

  @override
  // Isolate entry point
  void _isolateEntry(SendPort sendPort) {
    final ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    receivePort.listen((message) {
      int k = message[0];
      SendPort replyTo = message[1];
      BigInt term = calculateTerm(k);
      replyTo.send([k, term]);
    });
  }

  // Function to perform Pi calculation
  Future<String> _performPiCalculation(int prec, String logPath) async {
    BigInt s = BigInt.zero;
    int numProcesses = min(Platform.numberOfProcessors, 8);
    String piPath = '${Directory.current.path}/pi.txt';

    List<Isolate?> isolates = <Isolate?>[];
    List<SendPort> sendPorts = <SendPort>[];

    DateTime start = DateTime.now();

    await File(logPath).create(recursive: true);
    await File(piPath).create(recursive: true);

    IOSink fPi = File(piPath).openWrite();
    IOSink fLog = File(logPath).openWrite();

    try {
      // Create and initialize the isolates
      for (int i = 0; i < numProcesses; i++) {
        final ReceivePort receivePort = ReceivePort();
        isolates.add(await Isolate.spawn(_isolateEntry, receivePort.sendPort));
        SendPort sendPort = await receivePort.first as SendPort;
        sendPorts.add(sendPort);
      }

      List<Future> futures = <Future>[];

      for (int k = 0; k < prec; k++) {
        final ReceivePort receivePort = ReceivePort();
        SendPort sendPort = sendPorts[k % numProcesses];

        Future future = receivePort.first.then((data) {
          int index = data[0] as int;
          BigInt term = data[1] as BigInt;
          s += term;
        });

        futures.add(future);
        sendPort.send([k, receivePort.sendPort]);
      }

      await Future.wait(futures);

      for (Isolate? isolate in isolates) {
        isolate?.kill(priority: Isolate.immediate);
      }

      DateTime end = DateTime.now();
      Duration duration = end.difference(start);
      fLog.writeln('Calculation Time: ${duration.inSeconds} seconds');
    } finally {
      await fPi.close();
      await fLog.close();
    }

    return piPath;
  }

  Widget build(BuildContext context) {
    // Function to calculate Pi asynchronously
    Future<void> _calculatePi(int prec) async {
      setState(() {
        _isCalculating = true;
      });
      try {
        String logPath = '${Directory.current.path}/log.txt';
        String piPath = await _performPiCalculation(prec, logPath);
        setState(() {
          _result = 'Calculation Completed: $piPath';
        });
      } catch (e) {
        setState(() {
          _result = 'Error: $e';
        });
      } finally {
        setState(() {
          _isCalculating = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pi Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Precision',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  int prec = int.tryParse(_controller.text) ?? 0;
                  _calculatePi(prec);
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              _isCalculating
                  ? CircularProgressIndicator()
                  : Text(
                      'Result: $_result',
                      style: TextStyle(fontSize: 18),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// Standalone factorial function
BigInt factorial(int n) {
  BigInt result = BigInt.one;
  for (int i = 1; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

// Standalone calculate term function
BigInt calculateTerm(int k) {
  BigInt numerator = factorial(4 * k) *
      (BigInt.from(1103) + BigInt.from(26390) * BigInt.from(k));
  BigInt denominator = factorial(k) *
      factorial(k) *
      factorial(k) *
      factorial(k) *
      BigInt.from(396).pow(4 * k);
  return numerator ~/ denominator;
}

class PiCalculator {
  static const int mAGIC_100 = 100;
  static const int mAGIC_9801 = 9801;

  BigInt factorial(int n) {
    return n == 0 ? BigInt.one : BigInt.from(n) * factorial(n - 1);
  }

  BigInt calculateTerm(int k) {
    var numerator = factorial(4 * k) *
        (BigInt.from(1103) + BigInt.from(26390) * BigInt.from(k));
    var denominator = factorial(k) *
        factorial(k) *
        factorial(k) *
        factorial(k) *
        BigInt.from(396).pow(4 * k);
    return numerator ~/ denominator;
  }

  static void _isolateEntry(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    receivePort.listen((message) {
      int k = message[0];
      SendPort replyTo = message[1];
      var calculator = PiCalculator();
      BigInt term = calculator.calculateTerm(k);
      replyTo.send([k, term]);
    });
  }

  Future<String> calculatePi(int prec, String logPath) async {
    var s = BigInt.zero;
    var numProcesses = min(Platform.numberOfProcessors, 8);
    var piPath = '${Directory.current.path}/pi.txt';

    var isolates = <Isolate?>[];
    var sendPorts = <SendPort>[];

    var start = DateTime.now();

    await File(logPath).create(recursive: true);
    await File(piPath).create(recursive: true);

    var fPi = File(piPath).openWrite();
    var fLog = File(logPath).openWrite();

    // Create and initialize the isolates
    for (var i = 0; i < numProcesses; i++) {
      final receivePort = ReceivePort();
      isolates.add(await Isolate.spawn(_isolateEntry, receivePort.sendPort));
      var sendPort = await receivePort.first as SendPort;
      sendPorts.add(sendPort);
    }

    var futures = <Future>[];

    for (var k = 0; k < prec; k++) {
      final receivePort = ReceivePort();
      var sendPort = sendPorts[k % numProcesses];

      var future = receivePort.first.then((data) {
        var index = data[0] as int;
        var term = data[1] as BigInt;
        s += term;
        if (index % mAGIC_100 == 0) {
          var inversePi = (2 * sqrt(2) / mAGIC_9801) * s.toDouble();
          var pi = 1 / inversePi;
          fPi.writeln('$index: $pi');
          var progress = (index / prec) * 100;
        }
      });

      futures.add(future);
      sendPort.send([k, receivePort.sendPort]);
    }

    await Future.wait(futures);

    for (var isolate in isolates) {
      isolate?.kill(priority: Isolate.immediate);
    }

    var end = DateTime.now();
    var duration = end.difference(start);
    fLog.writeln('t.utility4CalculateTime ${duration.inSeconds}');
    await fPi.close();
    await fLog.close();

    return piPath;
  }
}

class RandomCodeGenerator {
  static const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  static const String digits = '0123456789';
  static const String specialCharacters = '!@#\$%^&*()-_+=<>?';

  String generateCode({
    required int length,
    bool includeUpperCase = true,
    bool includeLowerCase = true,
    bool includeDigits = true,
    bool includeSpecialCharacters = true,
  }) {
    String charSet = '';

    if (includeUpperCase) charSet += upperCaseLetters;
    if (includeLowerCase) charSet += lowerCaseLetters;
    if (includeDigits) charSet += digits;
    if (includeSpecialCharacters) charSet += specialCharacters;

    if (charSet.isEmpty) {
      throw ArgumentError('At least one type of character should be included');
    }

    final Random random = Random();
    return List.generate(length, (index) {
      final int randomIndex = random.nextInt(charSet.length);
      return charSet[randomIndex];
    }).join('');
  }
}

class RandomCodeGeneratorScreen extends StatefulWidget {
  @override
  _RandomCodeGeneratorScreenState createState() =>
      _RandomCodeGeneratorScreenState();
}

class _RandomCodeGeneratorScreenState extends State<RandomCodeGeneratorScreen> {
  final _formKey = GlobalKey<FormState>();
  int _length = 12;
  bool _includeUpperCase = true;
  bool _includeLowerCase = true;
  bool _includeDigits = true;
  bool _includeSpecialCharacters = true;
  String _generatedCode = '';

  void _generateCode() {
    final RandomCodeGenerator generator = RandomCodeGenerator();
    setState(() {
      _generatedCode = generator.generateCode(
        length: _length,
        includeUpperCase: _includeUpperCase,
        includeLowerCase: _includeLowerCase,
        includeDigits: _includeDigits,
        includeSpecialCharacters: _includeSpecialCharacters,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.utility3Title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: t.utility3Length),
                  keyboardType: TextInputType.number,
                  initialValue: _length.toString(),
                  onChanged: (value) {
                    setState(() {
                      _length = int.parse(value);
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(t.utility3UpperCase),
                  value: _includeUpperCase,
                  onChanged: (value) {
                    setState(() {
                      _includeUpperCase = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(t.utility3LowerCase),
                  value: _includeLowerCase,
                  onChanged: (value) {
                    setState(() {
                      _includeLowerCase = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(t.utility3Digits),
                  value: _includeDigits,
                  onChanged: (value) {
                    setState(() {
                      _includeDigits = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(t.utility3SpecialCharacters),
                  value: _includeSpecialCharacters,
                  onChanged: (value) {
                    setState(() {
                      _includeSpecialCharacters = value!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: _generateCode,
                  child: Text(t.utility3GeneratedTitle),
                ),
                SizedBox(height: 16),
                Text(
                  '${t.utility4Result} $_generatedCode',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
