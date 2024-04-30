import 'package:flutter/material.dart';
import 'dart:async';

class DivisionPage extends StatefulWidget {
  @override
  _DivisionPageState createState() => _DivisionPageState();
}

class _DivisionPageState extends State<DivisionPage> {
  int num1 = 0;
  int num2 = 0;
  String display = '';
  final answerController = TextEditingController();
  bool showAnswerField = false;

  @override
  void initState() {
    super.initState();
    generateNumbers();
  }

  void generateNumbers() {
    setState(() {
      num1 = 5; // Здесь можно использовать любой генератор случайных чисел
      display = '$num1';
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        display = ''; // Скрываем первое число
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          num2 = 7; // Здесь можно использовать любой генератор случайных чисел
          display = '$num2';
        });

        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            display = ''; // Скрываем второе число
            showAnswerField = true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ментальный счет'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              display,
              style: Theme.of(context).textTheme.headline4,
            ),
            if (showAnswerField)
              Text(
                'Введите ответ',
                style: Theme.of(context).textTheme.headline6,
              ),
            if (showAnswerField)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: answerController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ответ',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
