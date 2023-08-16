import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/http_service.dart';
import '../../services/tokens.dart';
import '../../services/user_responce/user_responce.dart';

class PersonInfo extends StatefulWidget {
  final int personId;

  const PersonInfo({super.key, @PathParam() required this.personId});

  @override
  State<PersonInfo> createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
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

  Widget InfoPole(
    String claster,
    String podclaster,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 62, 62, 67),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              claster,
              style: GoogleFonts.montserrat(
                  color: Color(0xFF686868), fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 5,
            ),
            child: Text(
              podclaster,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget Allinformation(UserResponce user) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: InfoPole(
            'Имя',
            '${user.firstName} ${user.lastName}',
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: InfoPole(
            'телефон',
            user.phoneNumber,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: InfoPole(
            'Дата рождения',
            user.dateBorn,
          ),
        ),
      ],
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
              child: FutureBuilder<UserResponce>(
                builder: (context, snapshot) => snapshot.hasData
                    ? Allinformation(snapshot.data!)
                    : const CircularProgressIndicator(
                        color: Color(0xFFBF5AF2),
                      ),
                future: getInfo(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
