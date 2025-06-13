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
  int _selectedQuestion = 0;
  bool _showResult = false;

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

  final List<Map<String, Object>> _result = [];

  void _responder(String selectedAnswer) {
    _result.add({
      'question': questions[_selectedQuestion]['text'] as String,
      'answer': selectedAnswer,
    });

    if (_selectedQuestion < questions.length - 1) {
      setState(() {
        _selectedQuestion++;
      });
    } else {
      setState(() {
        _selectedQuestion = 0;
        _showResult = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Perguntas e Respostas",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Question(questions[_selectedQuestion]['text'] as String),
            SizedBox(height: 20),
            Column(
              spacing: 8,
              children: [
                ...(questions[_selectedQuestion]['answers'] as List<String>)
                    .map(
                      (answer) => Response(
                        answer,
                        () => _showResult ? null : _responder(answer),
                      ),
                    ),
              ],
            ),
            SizedBox(height: 20),
            if (_showResult)
              Column(
                spacing: 10,
                children: [
                  ..._result.asMap().entries.map(
                    (entry) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Pergunta ${entry.key + 1}: ${entry.value['question']}',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Resposta: ${entry.value['answer']}',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showResult = false;
                          _result.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      child: Text("Reiniciar"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
