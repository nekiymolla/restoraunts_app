import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import '../../services/dialog.dart';
import '../../services/tokens.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _numberController = TextEditingController(text: "+7");
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final apiProvider = Provider(create: (ref) => SessionManager());

  Widget _button() {
    // ignore: non_constant_identifier_names
    final ButtonStyle Elstyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 150, right: 150),
      foregroundColor: const Color(0xFFBF5AF2),
      backgroundColor: const Color(0xFFBF5AF2),
    );
    return ElevatedButton(
      style: Elstyle,
      onPressed: () async {
        signUp();
      },
      child: Text(
        'Дальше',
        style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _inputNumber(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          // for version 2 and greater youcan also use this
          FilteringTextInputFormatter.digitsOnly
        ],
        cursorColor: Colors.white,
        controller: controller,
        obscureText: obscure,
        style: GoogleFonts.montserrat(
            textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2C2C2E),
          hintStyle: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
          hintText: hint,
        ),
      ),
    );
  }

  Widget _input(String hint, TextEditingController controller, bool obscure) {
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

  Widget _inputDate(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      child: TextField(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickedDate != null) {
            setState(() {
              _dateController.text =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
            });
          }
        },
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
        _inputNumber('Номер телефона', _numberController, false),
        const SizedBox(height: 10),
        _input('Имя', _firstNameController, false),
        const SizedBox(height: 10),
        _input('Фамилия', _lastNameController, false),
        const SizedBox(height: 10),
        _inputDate('Дата рождения', _dateController, false),
        const SizedBox(height: 10),
        _input('E-mail', _emailController, false),
        const SizedBox(height: 10),
        _input('Пароль', _passwordController, true),
      ],
    );
  }

  Future<void> signUp() async {
    if (_numberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _dateController.text.isNotEmpty) {
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
          ("http://188.225.44.128:3000/auth/signUp"),
          data: {
            "phoneNumber": _numberController.text,
            "password": _passwordController.text,
            "firstName": _firstNameController.text,
            "lastName": _lastNameController.text,
            "dateBorn": DateTime.parse(_dateController.text).toIso8601String(),
            "email": _emailController.text,
            HttpHeaders.contentTypeHeader: 'application/json'
          },
        );
        if (response.statusCode == 201) {
          print(response.data!.keys);
          final token = response.data!['accessToken'];
          SessionManager().updatetoken(token);
          showSuccess(context);
        } else {}
      } catch (e) {}
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
          body: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
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
                  padding: const EdgeInsets.only(top: 30),
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
              padding: const EdgeInsets.only(right: 180),
              child: Text(
                'Регистрация',
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                )),
              ),
            ),
            const SizedBox(height: 20),
            allInputs(),
            const SizedBox(height: 250),
            _button(),
          ]),
        ),
      ),
    );
  }
}
