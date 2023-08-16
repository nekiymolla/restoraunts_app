import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaraunts/Pages/auth_pages/login_page.dart';
import 'package:restaraunts/Pages/auth_pages/registration_page.dart';
import 'package:restaraunts/routes/router.gr.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Widget chooseauth() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextButton(
              onPressed: () {
                context.router.push(const RegistrationPageRoute());
              },
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.person_add,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 30),
                  Text(
                    'Зарегистрироваться',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Color(0xFF00AADF), fontSize: 20)),
                  )
                ],
              )),
        ),
        const Divider(
          color: Color.fromARGB(255, 132, 131, 129),
          height: 0,
          indent: 20,
          endIndent: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextButton(
              onPressed: () {
                context.router.push(const LoginPageRoute());
              },
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.lock_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 30),
                  Text(
                    'Войти',
                    style: GoogleFonts.montserrat(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                  )
                ],
              )),
        ),
        const Divider(
          color: Color.fromARGB(255, 132, 131, 129),
          height: 0,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Text(
                    'Авторизация',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(alignment: Alignment.bottomCenter, child: chooseauth()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
