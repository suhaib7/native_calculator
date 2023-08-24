import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var channel = const MethodChannel('result');
  String _result = 'No result yet';
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  Future<void> getAdditionalResult(String num1, String num2) async {
    String finalResult;
    try {
      final String result = await channel
          .invokeMethod("getAdditionResult", {"num1": num1, "num2": num2});
      finalResult = 'Result: $result';
    } on PlatformException catch (e) {
      finalResult = 'Failed to get result';
    }
    setState(() {
      _result = finalResult;
    });
  }

  Future<void> getSubtractionResult(String num1, String num2) async {
    String finalResult;
    try {
      final String result = await channel
          .invokeMethod("getSubtractionResult", {"num1": num1, "num2": num2});
      finalResult = 'Result: $result';
    } on PlatformException catch (e) {
      finalResult = 'Failed to get Result';
    }
    setState(() {
      _result = finalResult;
    });
  }

  Future<void> getMultiplicationResult(String num1, String num2) async {
    String finalResult;
    try {
      final String result = await channel.invokeMethod(
          "getMultiplicationResult", {"num1": num1, "num2": num2});
      finalResult = 'Result: $result';
    } on PlatformException catch (e) {
      finalResult = 'Failed to get result';
    }
    setState(() {
      _result = finalResult;
    });
  }

  Future<void> getDivisionResult(String num1, String num2) async {
    String finalResult;
    try {
      final String result = await channel
          .invokeMethod("getDivisionResult", {"num1": num1, "num2": num2});
      finalResult = 'Result: $result';
    } on PlatformException catch (e) {
      finalResult = 'Failed to get result';
    }
    setState(() {
      _result = finalResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 100),
                    child: Row(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'First Number',
                            ),
                            controller: _textEditingController1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 180,
                          width: 180,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Second Number",
                            ),
                            controller: _textEditingController2,
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            String num1 = _textEditingController1.text;
                            String num2 = _textEditingController2.text;
                            getAdditionalResult(num1, num2);
                          },
                          child: const Text('+'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String num1 = _textEditingController1.text;
                            String num2 = _textEditingController2.text;

                            getSubtractionResult(num1, num2);
                          },
                          child: const Text('-'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String num1 = _textEditingController1.text;
                            String num2 = _textEditingController2.text;

                            getMultiplicationResult(num1, num2);
                          },
                          child: const Text('*'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String num1 = _textEditingController1.text;
                            String num2 = _textEditingController2.text;

                            getDivisionResult(num1, num2);
                          },
                          child: const Text('%'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(_result),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
