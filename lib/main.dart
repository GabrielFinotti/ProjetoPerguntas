import 'package:flutter/material.dart';
import 'question.dart';
import 'response.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int selectedQuestion = 0;

  final List<Map<String, Object>> questions = [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': ['Azul', 'Verde', 'Amarelo', 'Vermelho', 'Preto', 'Branco'],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': ['Cachorro', 'Gato', 'Pássaro', 'Cavalo', 'Leão', 'Tigre'],
    },
    {
      'text': 'Qual é o seu Instrutor favorito?',
      'answers': ['João', 'Maria', 'Pedro', 'Ana', 'Bruno', 'Carlos'],
    },
  ];

  final List<Map<String, Object>> result = [];

  void _responder(String selectedAnswer) {
    result.add({
      'question': questions[selectedQuestion]['text'] as String,
      'answer': selectedAnswer,
    });

    if (selectedQuestion < questions.length - 1) {
      setState(() {
        selectedQuestion++;
      });
    } else {
      for (var i = 0; i < result.length; i++) {
        debugPrint('Pergunta ${i + 1}: ${result[i]['question']}');
        debugPrint('Resposta: ${result[i]['answer']}');
      }

      result.clear();

      setState(() {
        selectedQuestion = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Perguntas e Respostas")),
        body: Column(
          children: [
            Question(questions[selectedQuestion]['text'] as String),
            ...(questions[selectedQuestion]['answers'] as List<String>).map(
              (answer) => Response(answer, () => _responder(answer)),
            ),
          ],
        ),
      ),
    );
  }
}
