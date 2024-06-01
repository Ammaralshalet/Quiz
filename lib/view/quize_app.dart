import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<List<ModelQustion>> getQuiz() async {
  Dio req = Dio();
  Response response =
      await req.get("https://665712ac9f970b3b36c7d676.mockapi.io/qustion");
  List<ModelQustion> quiz = List.generate(
    response.data.length,
    (index) => ModelQustion.fromMap(response.data[index]),
  );
  return quiz;
}

PageController controller = PageController();

int correctAnswer = 0;
int worngAnswer = 0;

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getQuiz(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Scaffold(
                  backgroundColor: const Color(0xff8D376F),
                  body: Column(
                    children: [
                      Text(
                        snapshot.data![index].qustion,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 100,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: snapshot.data![index].answer.length,
                          separatorBuilder: (context, ind) => const Divider(),
                          itemBuilder: (context, ind) {
                            return Dismissible(
                              key: ValueKey(ind),
                              child: ListTile(
                                onTap: () {
                                  if (ind ==
                                      snapshot
                                          .data![index].indexOfCorrectAnswer) {
                                    correctAnswer++;

                                    controller.nextPage(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceOut,
                                    );
                                  } else {
                                    worngAnswer++;
                                  }

                                  if (index + 1 < snapshot.data!.length) {
                                    controller.nextPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeInOut,
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ResultPage(),
                                      ),
                                    );
                                  }
                                },
                                leading: CircleAvatar(
                                  child: Text((ind + 1).toString()),
                                ),
                                title: Text(snapshot.data![index].answer[ind]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8D376F),
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number of Correct Answer is : $correctAnswer',
              style: const TextStyle(fontSize: 24, color: Colors.green),
            ),
            Text('Number of Worng Answer is : $worngAnswer',
                style: const TextStyle(fontSize: 24, color: Colors.red))
          ],
        ),
      ),
    );
  }
}

class ModelQustion {
  String qustion;
  List<String> answer;
  int indexOfCorrectAnswer;
  ModelQustion({
    required this.qustion,
    required this.answer,
    required this.indexOfCorrectAnswer,
  });

  ModelQustion copyWith({
    String? qustion,
    List<String>? answer,
    int? indexOfCorrectAnswer,
  }) {
    return ModelQustion(
      qustion: qustion ?? this.qustion,
      answer: answer ?? this.answer,
      indexOfCorrectAnswer: indexOfCorrectAnswer ?? this.indexOfCorrectAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qustion': qustion,
      'answer': answer,
      'indexOfCorrectAnswer': indexOfCorrectAnswer,
    };
  }

  factory ModelQustion.fromMap(Map<String, dynamic> map) {
    return ModelQustion(
      qustion: map['qustion'] as String,
      answer: List<String>.from(map['answer'] as List<dynamic>),
      indexOfCorrectAnswer: map['indexOfCorrectAnswer'] as int,
    );
  }
}
