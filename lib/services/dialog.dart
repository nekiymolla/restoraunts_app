import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaraunts/routes/router.gr.dart';

void showErrorLogIn(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Ошибка!"),
        content: const Text("Неверный логин или пароль"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK",
                style: TextStyle(
                  color: Color(0xFFBF5AF2),
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showErrorNull(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Ошибка!"),
        content: const Text("Введите номер телефона и пароль"),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "OK",
              style: TextStyle(
                color: Color(0xFFBF5AF2),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showSuccess(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Отлично"),
        content: const Text("Аккаунт успешно создан!"),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "OK",
              style: TextStyle(
                color: Color(0xFFBF5AF2),
              ),
            ),
            onPressed: () {
              context.router.replaceAll([const BottomNavPageRoute()]);
            },
          ),
        ],
      );
    },
  );
}

showLoadingDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0),
    builder: (BuildContext context) {
      return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const CircularProgressIndicator(
                  color: Colors.black,
                )),
          ));
    });
