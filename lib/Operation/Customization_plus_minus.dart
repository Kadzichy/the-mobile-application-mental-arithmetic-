import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class PlusMinusPage extends StatefulWidget {
  @override
  _PlusMinusPageState createState() => _PlusMinusPageState();
}

class _PlusMinusPageState extends State<PlusMinusPage> {
  double _sliderValue1 = 5; // Количество примеров
  double _sliderValue2 = 5; // Разряд
  double _sliderValue3 = 5; // Скорость появления чисел
  double _sliderValue4 = 5; // Пауза для ввода ответов
  TextEditingController _controller = TextEditingController();
  int _correctAnswers = 0;
  int _incorrectAnswers = 0;

  void _startTimer() {
    int numberOfExamples = _sliderValue1.toInt();
    int range = (_sliderValue2 * 2).toInt();
    int speed = _sliderValue3.toInt();
    int pause = _sliderValue4.toInt();

    int number1 = Random().nextInt(range);
    int number2 = Random().nextInt(range);
    Timer(Duration(seconds: speed), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondRoute(number1, number2, pause, _startNextExample)),
      );
    });
  }

  void _startNextExample() {
    int numberOfExamples = _sliderValue1.toInt();
    int range = (_sliderValue2 * 2).toInt();
    int speed = _sliderValue3.toInt();
    int pause = _sliderValue4.toInt();

    int number1 = Random().nextInt(range);
    int number2 = Random().nextInt(range);
    Timer(Duration(seconds: speed), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondRoute(number1, number2, pause, _startNextExample)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F2F1),
      appBar: AppBar(
        title: Text('Настройка сложности уровня'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Выберите количество примеров',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            DivisionSlider(
              value: _sliderValue1,
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (double value) {
                setState(() {
                  _sliderValue1 = value;
                });
              },
            ),

            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Выберите разряд чисел',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            DivisionSlider(
              value: _sliderValue2,
              min: 1,
              max: 30,
              divisions: 29,
              onChanged: (double value) {
                setState(() {
                  _sliderValue2 = value;
                });
              },
            ),

            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Выберите скорость появления чисел',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            DivisionSlider(
              value: _sliderValue3,
              min: 1,
              max: 15,
              divisions: 14,
              onChanged: (double value) {
                setState(() {
                  _sliderValue3 = value;
                });
              },
            ),


            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Пауза прехода к другому пимеру ( в сек.)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            DivisionSlider(
              value: _sliderValue4,
              min:1,
              max: 60,
              divisions: 59,
              onChanged: (double value) {
                setState(() {
                  _sliderValue4 = value;
                });
              },
            ),


            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Начать'),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  final int number1;
  final int number2;
  final int pause;
  final Function onExampleFinished;

  SecondRoute(this.number1, this.number2, this.pause, this.onExampleFinished);

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  late int _numberToShow;
  late String _answer;
  late bool _showAnswerField;
  late bool _showCheckAnswer;
  late bool _showIncorrectAnswer;
  late bool _showEmptyAnswer;

  @override
  void initState() {
    super.initState();
    _numberToShow = widget.number1;
    _answer = '';
    _showAnswerField = false;
    _showCheckAnswer = false;
    _showIncorrectAnswer = false;
    _showEmptyAnswer = false;
    _startTimer();
  }

  void _startTimer() {
    Timer(Duration(seconds: widget.pause), () {
      setState(() {
        _numberToShow = widget.number2;
      });
      Timer(Duration(seconds: widget.pause), () {
        setState(() {
          _showAnswerField = true;
        });
      });
    });
  }

  void _checkAnswer() {
    if (_answer.isEmpty) {
      setState(() {
        _showEmptyAnswer = true;
      });
    } else if (_answer == (widget.number1 + widget.number2).toString()) {
      setState(() {
        _showCheckAnswer = true;
      });
      Timer(Duration(seconds: widget.pause), () {
        widget.onExampleFinished();
        Navigator.pop(context);
      });
    } else {
      setState(() {
        _showIncorrectAnswer = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Число: $_numberToShow'),
            if (_showAnswerField)
              TextField(
                onChanged: (value) {
                  _answer = value;
                },
                decoration: InputDecoration(labelText: 'Ответ'),
              ),
            if (_showAnswerField)
              ElevatedButton(
                onPressed: _checkAnswer,
                child: Text('Ответить'),
              ),
            if (_showCheckAnswer)
              Text('Правильно!'),
            if (_showIncorrectAnswer)
              Text('Не правильно!'),
            if (_showEmptyAnswer)
              Text('Введите ответ'),
          ],
        ),
      ),
    );
  }
}

class DivisionSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  DivisionSlider({
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
        Row(
          children: List.generate(
            divisions + 1,
                (index) => Expanded(
              child: Text(
                (min + (max - min) / divisions * index).round().toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
