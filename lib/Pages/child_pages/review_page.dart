import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaraunts/Pages/child_pages/actual_info.dart';
import 'package:restaraunts/Pages/child_pages/rest_info.dart';
import 'package:restaraunts/routes/router.gr.dart';
import 'package:restaraunts/services/restaraunts_responce/restoraunts_controller.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _searchController = TextEditingController();

  Widget _buttonIconPopular() {
    final ButtonStyle Elstyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: const Color(0xFF464646),
      backgroundColor: const Color(0xFF464646),
      padding: EdgeInsets.zero,
    );
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        style: Elstyle,
        onPressed: () async {},
        child: const Icon(
          Icons.location_on_outlined,
          color: Color(0xFFFFFFFF),
          size: 25,
        ),
      ),
    );
  }

  Widget _buttonPopular() {
    final ButtonStyle Elstyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: const Color(0xFFBF5AF2),
      backgroundColor: const Color(0xFFBF5AF2),
    );
    return Container(
      height: 40,
      width: 210,
      child: ElevatedButton(
        style: Elstyle,
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ActualRestInfo(),
            ),
          );
        },
        child: const Text(
          'Подробнее о ресторане',
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _popular() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF282828),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  spreadRadius: 0.10,
                  blurRadius: 13.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF2C2C2C),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'LV_Party',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 95,
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                'Сегодня в 22:00',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 1),
                            child: Icon(
                              Icons.audiotrack_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Mironov, Aver',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 5,
                            ),
                            child: _buttonPopular(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 5,
                            ),
                            child: _buttonIconPopular(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 200,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF282828),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  spreadRadius: 0.10,
                  blurRadius: 13.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF2C2C2C),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'LV_Party',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 95,
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                'Сегодня в 22:00',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 1),
                            child: Icon(
                              Icons.audiotrack_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Mironov, Aver',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 5,
                            ),
                            child: _buttonPopular(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 5,
                            ),
                            child: _buttonIconPopular(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget search() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10.0,
            spreadRadius: 0.2,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: TextField(
            cursorColor: const Color(0xFFBF5AF2),
            style: const TextStyle(
              color: Color(0xFFBF5AF2),
            ),
            controller: _searchController,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: const Color(0xFF2C2C2C),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF686868),
              ),
              hintStyle: const TextStyle(color: Color(0xFF686868)),
              hintText: 'Поиск лучших мест города',
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF2C2C2C), width: 0.0),
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Color(0xFF2C2C2C), width: 0.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionsList() {
    return Container(
      color: const Color(0xFF282828),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFF282828),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                toolbarHeight: 80,
                snap: true,
                floating: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: search(),
                  ),
                ],
              ),
            ],
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF282828),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Популярные рестораны',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Места где стоит побывать (〜￣▽￣)〜',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                        color: Color(0xFF686868),
                        fontSize: 18,
                      )),
                    ),
                  ),
                  _popular(),
                  const Divider(
                    color: Color.fromARGB(255, 132, 131, 129),
                    height: 10,
                    indent: 60,
                    thickness: 2,
                    endIndent: 60,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Список всех ресторанов',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Все рестораны в городе и не только',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: _controller.restoraunts.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: InkWell(
                            onTap: () {
                              context.router.navigate(InfoRestRouter(
                                  infoId: _controller.restoraunts[index].id!));
                            },
                            child: Container(
                              height: 120,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 20),
                                      child: Text(
                                        '${_controller.restoraunts[index].name}',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Text(
                                      '${_controller.restoraunts[index].address}',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF686868),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'С ${_controller.restoraunts[index].timeOpening} до ${_controller.restoraunts[index].timeClosed}',
                                            style: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) => Obx((() => Column(
        children: <Widget>[
          Expanded(
              child: _controller.isLoadingGetAllRestoraunts.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Color(0xFFBF5AF2),
                    ))
                  : _actionsList())
        ],
      )));

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RestorauntsController());

    return Scaffold(
      body: _body(context),
    );
  }

  RestorauntsController get _controller => Get.find<RestorauntsController>();
}
