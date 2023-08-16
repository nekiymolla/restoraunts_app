// ignore_for_file: non_constant_identifier_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaraunts/routes/router.gr.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        context.router.replaceAll([const BottomNavPageRoute()]);
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
        _inputAuth('Новый пароль', _emailController, true),
        const SizedBox(height: 10),
        _inputAuth('Пароль ещё раз', _passwordController, true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
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
                    padding: const EdgeInsets.only(top: 350),
                    child: _button(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
