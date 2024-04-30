import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F2F1),
      appBar: AppBar(
        title: Text('Разработка мобильного приложения для ментальной арифметики и тренировок ума'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {},
              onExit: (_) {},
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Color(0xFF5C6BC0); // Цвет текста при наведении
                      return Colors.black; // Цвет текста по умолчанию
                    },
                  ),
                ),
                child: Text('Войти'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Добавить немного пространства между кнопками
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {},
              onExit: (_) {},
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Color(0xFF5C6BC0); // Цвет текста при наведении
                      return Colors.black; // Цвет текста по умолчанию
                    },
                  ),
                ),
                child: Text('Выйти'),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
