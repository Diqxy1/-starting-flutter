// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import './question.dart';
import './reply.dart';

main() {
  runApp(QuestionApp());
}

class _QuestionAppState extends State<QuestionApp>{
  var _questionSelected = 0;

  final _question = const [
      {
        'text': 'Qual é a sua cor favorita ?',
        'reply': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'text': 'Qual é o seu animal favorita ?',
        'reply': ['Coelho', 'Cobra', 'Elefante', 'Leão']
      },
      {
        'text': 'Qual é o seu instutor favorito ?',
        'reply': ['Léo', 'JP', 'Aluizio', 'Autodidata']
      }
  ];

  void _answer() {
    if(questionAsked) {
      setState(() {
        _questionSelected++;
      });
    }
  }

  bool get questionAsked {
    return _questionSelected < _question.length;
  }

  @override
  Widget build(BuildContext context) {
    
    List<String> replys = questionAsked ? _question[_questionSelected].cast()['reply']: [];
    List<Widget> widgets = replys.map((text) => Reply(text, _answer)).toList();

    /* for(var textReply in replys){
      widgets.add(Reply(textReply, _answer));
    } */

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: questionAsked ? Column(
          children: <Widget>[
            Question(_question[_questionSelected]['text'].toString()),
            ...widgets
          ],
        ) : Center(
          child: Text(
            'Parabéns!',
            style: TextStyle(fontSize: 28),
            ),
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  
  @override
  // ignore: library_private_types_in_public_api
  _QuestionAppState createState() {
    return _QuestionAppState();
  }

}