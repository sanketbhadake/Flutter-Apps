import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizeApp(),
    );
  }
}

class QuizeApp extends StatefulWidget {
  const QuizeApp({super.key});
  @override
  State createState() => _QuizeApp();
}

class _QuizeApp extends State {
  List<Map> allquestion = [
    {
      "Question":
          "What is the primary programming language used to develop Flutter applications ? ",
      "option": ["Java", "Dart", "Python", "Kotlin"],
      "correct": 1,
    },
    {
      "Question":
          "Which widget is used in Flutter to create a scrollable list of items ?",
      "option": ["Column", "Row", "ListView", "Container"],
      "correct": 2,
    },
    {
      "Question": "Who is the founder of Google ?",
      "option": ["Lary page", "steav jobs", "Bill gets", "Elone musk"],
      "correct": 0,
    },
    {
      "Question": "In Python, which keyword is used to define a function? ?",
      "option": ["lambda", "def", "function", "func"],
      "correct": 1,
    },
    {
      "Question": "Which gas is most abundant in Earth's atmosphere?",
      "option": [
        "Oxygen",
        "Carbon Dioxide",
        "Hydrogen",
        "Nitrogen",
      ],
      "correct": 3,
    }
  ];

  int currentquestionindex = 0;
  int selectAnswerindex = -1;
  int count = 0;
  int count1 = 0;

  WidgetStateProperty<Color?> checkanswer(int answerindex) {
    if (selectAnswerindex != -1) {
      if (answerindex == allquestion[currentquestionindex]['correct']) {
        count++;
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectAnswerindex == answerindex) {
        count1++;
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  bool questionpage = true;
  @override
  Widget build(BuildContext context) {
    return Questionscreen();
  }

  Scaffold Questionscreen() {
    int score = count - count1;
    if (questionpage == true) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Quize App',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 32, 198, 190),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 25,
                    width: 130,
                  ),
                  Text(
                    "Questios: ${currentquestionindex + 1}/"
                    "${allquestion.length}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: 350,
                  child: Text(
                    allquestion[currentquestionindex]["Question"],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 30,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkanswer(0),
                  ),
                  onPressed: () {
                    if (selectAnswerindex == -1) {
                      selectAnswerindex = 0;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "A.${allquestion[currentquestionindex]['option'][0]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 30,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkanswer(1),
                  ),
                  onPressed: () {
                    if (selectAnswerindex == -1) {
                      selectAnswerindex = 1;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "B.${allquestion[currentquestionindex]['option'][1]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 30,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkanswer(2),
                  ),
                  onPressed: () {
                    if (selectAnswerindex == -1) {
                      selectAnswerindex = 2;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "C.${allquestion[currentquestionindex]['option'][2]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 30,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkanswer(3),
                  ),
                  onPressed: () {
                    if (selectAnswerindex == -1) {
                      selectAnswerindex = 3;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "D.${allquestion[currentquestionindex]['option'][3]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FloatingActionButton(
              onPressed: () {
                if (currentquestionindex > 0) {
                  setState(() {
                    currentquestionindex--;
                    selectAnswerindex = -1;
                  });
                }
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              onPressed: () {
                if (selectAnswerindex != -1) {
                  if (currentquestionindex < allquestion.length - 1) {
                    currentquestionindex++;
                  } else {
                    questionpage = false;
                  }
                  selectAnswerindex = -1;

                  setState(() {});
                }
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.arrow_forward),
            ),
          ]));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quize Result',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 32, 198, 190),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              "https://th.bing.com/th/id/R.2c3faa62fc6d502a1b55fa4d62ee948f?rik=uWfUrdeC7IISIg&riu=http%3a%2f%2ffreedesignfile.com%2fupload%2f2014%2f07%2fFunny-cartoon-sporting-design-vector-04.jpg&ehk=193PickXm6cR4udnFobA4fzSg2c6I27Q0X3oq%2fiPVD8%3d&risl=&pid=ImgRaw&r=0",
              height: 400,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Congratulations!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            Text(
              "Score:$score/5 ",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                onPressed: () {
                  setState(() {
                    currentquestionindex = 0;
                    selectAnswerindex = -1;
                    count = 0;
                    count1 = 0;
                    questionpage = true;
                  });
                },
                child: const Text("RESET QUIZE ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))),
          ],
        ),
      );
    }
  }
}
