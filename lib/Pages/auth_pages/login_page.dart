// ignore_for_file: non_constant_identifier_names
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:restaraunts/routes/router.gr.dart';
import 'package:restaraunts/services/dialog.dart';

import '../../services/tokens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _numberController = TextEditingController(text: '79510381378');
  final _passwordController = TextEditingController(text: 'mcshadow1');
  final apiProvider = Provider(create: (ref) => SessionManager());

  Widget _button() {
    
    final ButtonStyle Elstyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 150, right: 150),
      foregroundColor: const Color(0xFFBF5AF2),
      backgroundColor: const Color(0xFFBF5AF2),
    );
    return ElevatedButton(
      style: Elstyle,
      onPressed: () async {
        login();
      },
      child: Text(
        'Дальше',
        style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _inputAuth(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      child: TextField(
        cursorColor: Colors.white,
        controller: controller,
        obscureText: obscure,
        style: GoogleFonts.montserrat(
            textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          focusColor: const Color(0xFFBF5AF2),
          fillColor: const Color(0xFF2C2C2E),
          hintStyle: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
          hintText: hint,
        ),
      ),
    );
  }

  Widget allInputs() {
    return Column(
      children: <Widget>[
        _inputAuth('E-mail', _numberController, false),
        const SizedBox(height: 10),
        _inputAuth('Пароль', _passwordController, true),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                context.router.push(const ForgotPasswordRoute());
              },
              child: Text(
                'Забыли пароль?',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: TextButton(
              onPressed: () {
                context.router.push(const RegistrationPageRoute());
              },
              child: Text(
                'Зарегистрироваться',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> login() async {
    if (_numberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      SessionManager.api.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
      try {
        apiProvider;
        var response = await SessionManager.api.post(
          ("http://188.225.44.128:3000/auth/signIn"),
          data: {
            "phoneNumber": _numberController.text,
            "password": _passwordController.text,
            HttpHeaders.contentTypeHeader: 'application/json'
          },
        );
        if (response.statusCode == 200) {
          print(response.data!.keys);
          final token = response.data!['accessToken'];
          SessionManager().updatetoken(token);
          context.router.replaceAll([const BottomNavPageRoute()]);
        } else {}
      } catch (e) {
        showErrorLogIn(context);
      }
    } else {
      showErrorNull(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: MaterialApp(
          home: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 20),
                    child: IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text(
                      'Авторизация',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                        color: Color(0xFFBF5AF2),
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'Вход',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )),
                ),
              ),
              const SizedBox(height: 180),
              allInputs(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: _button(),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
