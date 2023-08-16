import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaraunts/Pages/child_pages/person_info.dart';
import 'package:restaraunts/routes/router.gr.dart';

import '../../services/http_service.dart';
import '../../services/tokens.dart';
import '../../services/user_responce/user_responce.dart';

class ProfilaPage extends StatefulWidget {
  const ProfilaPage({super.key});

  @override
  State<ProfilaPage> createState() => _ProfilaPageState();
}

class _ProfilaPageState extends State<ProfilaPage> {
  late HttpService http;
  late UserResponce userResponce;

  Future<UserResponce> getInfo() async {
    try {
      Response response = await SessionManager.api.request(
          "http://188.225.44.128:3000/accounts/getInfo",
          options: Options(method: 'GET'));
      if (response.statusCode == 200) {
        userResponce = UserResponce.fromJson(response.data!);
        return userResponce;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    http = HttpService();
    super.initState();
  }

  Widget _profileCard(UserResponce user) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 0.10,
              blurRadius: 13.0,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 125,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 125),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF282828),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 125,
                child: Padding(
                  padding: const EdgeInsets.only(left: 150, top: 5),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.phone_android,
                          color: Colors.white,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          user.phoneNumber,
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.cake_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          user.dateBorn,
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 14),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 30),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B5B5B),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exit() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 0.10,
              blurRadius: 13.0,
            ),
          ],
        ),
        child: SizedBox(
          height: 50,
          width: 400,
          child: TextButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Выйти',
                style: GoogleFonts.montserrat(fontSize: 16, color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _activity() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 0.10,
              blurRadius: 13.0,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
                height: 50,
                width: 400,
                child: TextButton(
                  onPressed: () {
                    context.router.navigate(PersonInfoRouter(
                      personId: 1,
                    ));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Персональные данные',
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                )),
            SizedBox(
                height: 50,
                width: 400,
                child: TextButton(
                  onPressed: () {
                    context.router.navigate(FavoritesPageRouter(favoriteId: 1));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Избранное',
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                )),
            SizedBox(
                height: 50,
                width: 400,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Изменить пароль',
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget AllPage(UserResponce user) {
    return Column(
      children: <Widget>[_profileCard(user), _activity(), _exit()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF282828),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xFF282828),
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: FutureBuilder<UserResponce>(
                    builder: (context, snapshot) => snapshot.hasData
                        ? AllPage(snapshot.data!)
                        : const CircularProgressIndicator(
                            color: Color(0xFFBF5AF2),
                          ),
                    future: getInfo(),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
