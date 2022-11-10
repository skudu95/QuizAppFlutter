import 'package:flutter/material.dart';
import 'quiz.dart';

Quiz quiz = Quiz();

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App Flutter'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                bool correctAnswer = quiz.getCorrectAnswer();
                // if (correctAnswer == true) {
                if (correctAnswer) {
                  print('correct');
                } else {
                  print('incorrect');
                }
                setState(() {
                  quiz.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                bool correctAnswer = quiz.getCorrectAnswer();
                // if (correctAnswer == false) {
                if (!correctAnswer) {
                  print('correct');
                } else {
                  print('incorrect');
                }
                setState(() {
                  quiz.nextQuestion();
                });
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
