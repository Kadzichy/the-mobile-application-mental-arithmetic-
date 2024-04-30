import 'package:flutter/material.dart';
import 'Operation/multiplication.dart';
import 'Operation/Customization_plus_minus.dart';
import 'Operation/division.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F2F1),
      appBar: AppBar(
        title: Text('Главная страница'),
      ),
      body: SingleChildScrollView( // Используйте SingleChildScrollView для избежания переполнения
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Выберите арифметическую операцию',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
// Плюс/Минус button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // Горизонтальный отступ
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 100)), // Используйте double.infinity для ширины
                ),
                child: Text('Плюс/Минус'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlusMinusPage()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
// Умножение button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // Горизонтальный отступ
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 100)), // Используйте double.infinity для ширины
                ),
                child: Text('Умножение'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MultiplicationPage()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
// Деление button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // Горизонтальный отступ
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 100)), // Используйте double.infinity для ширины
                ),
                child: Text('Деление'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DivisionPage()),
                  );
                },
              ),
            ),
// Добавьте здесь другие кнопки или виджеты, если необходимо
          ],
        ),
      ),
    );
  }
}