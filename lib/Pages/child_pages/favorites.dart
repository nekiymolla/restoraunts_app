import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaraunts/services/favorites_responce/favorites_controller.dart';

import '../../routes/router.gr.dart';

class FavoritesPage extends StatefulWidget {
  final int favoriteId;
  const FavoritesPage({super.key, @PathParam() required this.favoriteId});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget FavoriteList() {
    return Container(
      color: const Color(0xFF282828),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xFF282828),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: _controller.favorites.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: InkWell(
                    onTap: () {
                      context.router.navigate(InfoRestRouter(
                          infoId: _controller.favorites[index].id!));
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
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                '${_controller.favorites[index].name}',
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
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              '${_controller.favorites[index].address}',
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
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'С ${_controller.favorites[index].timeOpening} до ${_controller.favorites[index].timeClosed}',
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 16),
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
        ),
      ),
    );
  }

  Widget _body(BuildContext context) => Obx(
        (() => Column(
              children: <Widget>[
                Expanded(
                    child: _controller.isLoadingGetAllFavorites.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Color(0xFFBF5AF2),
                          ))
                        : FavoriteList())
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoritesController());

    return Scaffold(
      body: _body(context),
    );
  }

  FavoritesController get _controller => Get.find<FavoritesController>();
}
