import 'dart:async';

import 'package:eighth_project/Logic/Answer_Logic.dart';
import 'package:eighth_project/model/QuestionModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: [QuestionsPage(), Results()],
      ),
    );
  }
}

double width_false = 25;
double width_true = 25;

double currect_answers_number = 0;
double wrong_answers_number = 0;

int score = 0;

List<QuestionModel> question = [
  QuestionModel(
      question: 'How many students in your class\n_from korea?',
      time: 20,
      answers: [
        AnswerModel(answer: 'come', isCorrect: false),
        AnswerModel(answer: 'comes', isCorrect: false),
        AnswerModel(answer: 'are comming', isCorrect: true),
        AnswerModel(answer: 'came', isCorrect: false),
      ]),
  QuestionModel(question: 'What__your favorate\nsport?', time: 20, answers: [
    AnswerModel(answer: 'is', isCorrect: true),
    AnswerModel(answer: 'be', isCorrect: false),
    AnswerModel(answer: 'are ', isCorrect: false),
    AnswerModel(answer: 'was', isCorrect: false),
  ]),
  QuestionModel(question: 'What__you do\n_yesterday?', time: 20, answers: [
    AnswerModel(answer: 'do', isCorrect: false),
    AnswerModel(answer: 'did', isCorrect: true),
    AnswerModel(answer: 'doing', isCorrect: false),
    AnswerModel(answer: 'does', isCorrect: false),
  ]),
  QuestionModel(question: 'I wish I\n_ you', time: 20, answers: [
    AnswerModel(answer: 'is', isCorrect: false),
    AnswerModel(answer: 'am', isCorrect: false),
    AnswerModel(answer: 'was', isCorrect: false),
    AnswerModel(answer: 'were', isCorrect: true),
  ]),
  QuestionModel(
      question: 'The eiffle tower is located\n_france',
      time: 20,
      answers: [
        AnswerModel(answer: 'above', isCorrect: false),
        AnswerModel(answer: 'at', isCorrect: false),
        AnswerModel(answer: 'in', isCorrect: true),
        AnswerModel(answer: 'on', isCorrect: false),
      ]),
];

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> with UitilityComponent {
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        answerTime++;
        if (answerTime == 20) {
          controller.nextPage(
              duration: Duration(seconds: 1), curve: Curves.easeIn);
          answerTime = 0;
          questionNumber++;
          width_false += 20;
          wrong_answers_number++;
          if (questionNumber == 6) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowResultsBottom(),
                ));
          }
        }
      });
    });
  }

  int questionNumber = 1;

  num answerTime = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          itemCount: question.length,
          itemBuilder: (context, index) => Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 480,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(164, 47, 193, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            )),
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          trailing: Icon(
                            Icons.menu_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 350, top: 40),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 450, top: 80),
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 120),
                      child: Container(
                        width: 400,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 400,
                              child: ListTile(
                                leading: Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(currect_answers_number.toString(),
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  31, 132, 53, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  31, 132, 53, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: 8,
                                          width: width_true,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                trailing: Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(208, 90, 4, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: 8,
                                          width: width_false,
                                        ),
                                      ),
                                      Text(wrong_answers_number.toString(),
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(208, 90, 4, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              child: Row(
                                children: [
                                  Text(
                                    'Question $questionNumber /5',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromRGBO(164, 47, 193, 1)),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              question[index].question,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color.fromRGBO(43, 38, 45, 1),
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 220, top: 90),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            value: answerTime / 20,
                            color: Color.fromRGBO(164, 47, 193, 1),
                          ),
                        ),
                      ),
                    ),

                    //?  answertime  .............................

                    Padding(
                      padding: const EdgeInsets.only(left: 240, top: 110),
                      child: Text(answerTime.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(164, 47, 193, 1))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Colors.white10,
                        height: 20,
                      ),
                      itemCount: question[index].answers.length,
                      itemBuilder: (context, ind) => InkWell(
                        onTap: () {
                          showMyFlushBar(context);
                          checkoutAnswer(question[index].answers[ind].isCorrect,
                              context, question[index].time, answerTime);
                          answerTime = 0;
                          questionNumber++;
                          if (questionNumber == 6) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowResultsBottom(),
                                ));
                          }
                        },
                        child: Container(
                          width: 300,
                          height: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Color.fromRGBO(164, 47, 193, 1),
                                width: 2,
                              )),
                          child: ListTile(
                            leading: Text(
                              question[index].answers[ind].answer,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromRGBO(43, 38, 45, 1)),
                            ),
                            trailing: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.3)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Now this is results page ..........

class Results extends StatelessWidget {
  const Results({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(164, 47, 193, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(164, 47, 193, 1),
          elevation: 0,
          leading: Icon(Icons.arrow_back),
          actions: [
            CircleAvatar(
              child: Image.asset('assets/person1.png'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                  ),
                  Icon(
                    Icons.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    size: 20,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                  ),
                  Icon(
                    Icons.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Month',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'All Times',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60, right: 25),
                          child: CircleAvatar(
                            maxRadius: 20,
                            child: Image.asset('assets/person2.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 10),
                          child: CircleAvatar(
                            child: Image.asset('assets/person3.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60, right: 25),
                          child: CircleAvatar(
                            child: Image.asset('assets/person4.png'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              width: 102,
                              height: 166,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(221, 144, 240, 0.70),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                  children: [
                                    Text(
                                      '2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 75,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '442pt',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ClipPath(
                              clipper: CustomClipPath2(),
                              child: Container(
                                width: 90,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(221, 144, 240, 0.70),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 75,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '453pt',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipPath(
                            clipper: CustomClipPath3(),
                            child: Container(
                              width: 102,
                              height: 166,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(221, 144, 240, 0.70),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                  children: [
                                    Text(
                                      '3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 75,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '433pt',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 490,
                height: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: index == 3
                              ? Colors.black.withOpacity(0.1)
                              : Color.fromARGB(255, 255, 255, 255),
                          indent: 20,
                          endIndent: 30,
                          thickness: 1,
                          height: 20,
                        ),
                    itemCount: 10,
                    itemBuilder: (context, index) => ListTile(
                          leading: Container(
                            height: 40,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '0' + index.toString(),
                                  style: TextStyle(
                                      color: Color.fromRGBO(43, 38, 45, 1),
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: CircleAvatar(
                                    maxRadius: 25,
                                    child: Image.asset(
                                      index == 0
                                          ? 'assets/person5.png'
                                          : index == 1
                                              ? 'assets/person6.png'
                                              : index == 2
                                                  ? 'assets/person7.png'
                                                  : index == 3
                                                      ? 'assets/person8.png'
                                                      : 'assets/person9.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              index == 0
                                  ? 'Moni'
                                  : index == 1
                                      ? 'Esha'
                                      : index == 2
                                          ? 'Kaosar'
                                          : index == 3
                                              ? 'Sam'
                                              : 'faris',
                              style: TextStyle(
                                  color: Color.fromRGBO(43, 38, 45, 1),
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          trailing: Container(
                            width: 60,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(251, 236, 255, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                index == 0
                                    ? score.toString()
                                    : index == 1
                                        ? score.toString()
                                        : index == 2
                                            ? score.toString()
                                            : index == 3
                                                ? score.toString()
                                                : score.toString(),
                                style: TextStyle(
                                    color: Color.fromRGBO(43, 38, 45, 1),
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(25, h);
    path.lineTo(w, h);
    path.lineTo(75, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.moveTo(0, 25);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPath3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.moveTo(25, 0);
    path.lineTo(0, h);
    path.lineTo(w - 25, h);
    path.lineTo(w, 25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ShowResultsBottom extends StatelessWidget {
  const ShowResultsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(164, 47, 193, 1),
        body: Center(
            child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(),
                ));
          },
          child: Container(
            width: 300,
            height: 48,
            decoration: BoxDecoration(
                color: Color.fromRGBO(221, 144, 240, 0.70),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                )),
            child: Container(
              child: Center(
                child: Text(
                  'Show results',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(43, 38, 45, 1)),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
