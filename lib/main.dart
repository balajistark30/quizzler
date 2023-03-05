import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz.dart';

Quizs quizs = Quizs();
int s = 0;
void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Quiz(),
      )),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> iconss = [];
  void score(bool correct) {
    setState(() {
      if (quizs.alertss() == true) {
        Alert(
          context: context,
          title: 'finished',
          desc: '$s your score',
        ).show();
        quizs.reset();
        iconss = [];
        s = 0;
      }

      bool checker = quizs.Gettf();
      if (correct == checker) {
        s++;
        iconss.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        iconss.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizs.nextquestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    Expanded ok(String s, Color c, Color ch, bool d) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: c,
            child: TextButton(
              child: Text(
                s,
                style: (TextStyle(color: ch)),
              ),
              onPressed: () {
                bool correct = quizs.Gettf();

                score(d);
              },
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                quizs.Gettextno(),
              ),
            ),
          ),
          ok(
            'True',
            Colors.green,
            Colors.white,
            true,
          ),
          ok(
            'False',
            Colors.red,
            Colors.white,
            false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: iconss,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
