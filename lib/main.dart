import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoveCalculater(),
    );
  }
}

class LoveCalculater extends StatefulWidget {
  const LoveCalculater({super.key});

  @override
  State<LoveCalculater> createState() => _LoveCalculaterState();
}

class _LoveCalculaterState extends State<LoveCalculater> {
  String firstName = "";
  String secondName = "";
  String compatibilityResult = "";
  // function for calulating love
  void calculateCompatibility() {
    if (firstName.isEmpty || secondName.isEmpty) {
      setState(() {
        compatibilityResult = 'Please enter both names.';
      });
      return;
    }

    final compatibilityScore = _calculateCompatibility(firstName, secondName);

    setState(() {
      compatibilityResult = '$compatibilityScore% Compatibility!';
    });
  }

  int _calculateCompatibility(String firstName, String secondName) {
    final combinedName = (firstName + secondName).toLowerCase();

    final compatibilityTable = {
      'a': 5,
      'b': 2,
      'c': 4,
      'd': 1,
      'e': 6,
      'f': 3,
      'g': 8,
      'h': 1,
      'i': 5,
      'j': 1,
      'k': 2,
      'l': 3,
      'm': 4,
      'n': 5,
      'o': 7,
      'p': 8,
      'q': 1,
      'r': 3,
      's': 2,
      't': 9,
      'u': 4,
      'v': 2,
      'w': 4,
      'x': 1,
      'y': 5,
      'z': 2,
    };

    int score = 0;

    for (int i = 0; i < combinedName.length; i++) {
      final char = combinedName[i];
      if (compatibilityTable.containsKey(char)) {
        score += compatibilityTable[char]!;
      }
    }

    score = (score * 100 / (combinedName.length * 9)).round();

    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Flutter Love'),
        backgroundColor: Colors.pink[800],
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
// body of the scaffold
      body: Padding(
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 60.0,
            ),
            TextField(
                decoration: InputDecoration(
                  hintText: "your name ",
                  filled: true,
                  fillColor: Colors.pink,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (value) {
                  setState(() {
                    firstName = value;
                  });
                }),
            SizedBox(
              height: 20,
              width: 20,
            ),
            TextField(
                decoration: InputDecoration(
                  hintText: "thier name ",
                  filled: true,
                  fillColor: Colors.pink,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (value) {
                  setState(() {
                    secondName = value;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            Text('Calculate🤙 love with your buddy 🙋‍♂️ '),
            SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: calculateCompatibility,
              style: OutlinedButton.styleFrom(primary: Colors.pink),
              child: Text('Calculate '),
            ),
            SizedBox(height: 25),
            Text(
              compatibilityResult,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
    );
  }
}
