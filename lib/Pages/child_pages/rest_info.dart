import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:restaraunts/services/rest_info_responce/rest_info_responce.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../services/dialog.dart';
import '../../services/tokens.dart';

late RestInfoResponce restInfoResponce;

class InfoRest extends StatefulWidget {
  final int infoId;
  const InfoRest({super.key, @PathParam() required this.infoId});

  @override
  State<InfoRest> createState() => _InfoRestState();
}

class _InfoRestState extends State<InfoRest> {
  final apiProvider = Provider(create: (ref) => SessionManager());

  Future<void> favAdd() async {
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
      var response = await SessionManager.api.patch(
        ("http://188.225.44.128:3000/restaurants/favorites/add/${widget.infoId}"),
      );
    } catch (e) {}
  }

  Widget AddToFavorite() {
    final ButtonStyle Elstyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: const Color(0xFFBF5AF2),
      backgroundColor: const Color(0xFFBF5AF2),
    );
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: Elstyle,
        onPressed: () async {
          favAdd();
        },
        child: const Text(
          'Добавить в избранное',
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<RestInfoResponce> getInfoPage() async {
    try {
      Response response = await SessionManager.api.request(
          "http://188.225.44.128:3000/restaurants/${widget.infoId}",
          options: Options(method: 'GET'));
      if (response.statusCode == 200) {
        restInfoResponce = RestInfoResponce.fromJson(response.data!);
        return restInfoResponce;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  final List<MapObject> mapObjects = [];
  final MapObjectId mapObjectId = const MapObjectId('normal_icon_placemark');
  PlaceMark() async {
    if (mapObjects.any((el) => el.mapId == mapObjectId)) {
      return;
    }
    final mapObject = PlacemarkMapObject(
      mapId: mapObjectId,
      point: Point(latitude: 51.776272, longitude: 55.099594),
      onTap: (PlacemarkMapObject self, Point point) =>
          print('Tapped me at $point'),
      opacity: 0.7,
      direction: 90,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image:
                BitmapDescriptor.fromAssetImage('assets/mapimages/place.png'),
            rotationType: RotationType.rotate),
      ),
    );
    setState(() {
      mapObjects.add(mapObject);
    });
  }

  Widget mainInfo(RestInfoResponce info) {
    return SizedBox(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Где?',
              style: GoogleFonts.montserrat(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 5,
            ),
            child: Text(
              info.address,
              style: GoogleFonts.montserrat(
                  fontSize: 16, color: const Color(0xFF6486868)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 200,
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
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: YandexMap(
                  scrollGesturesEnabled: false,
                  nightModeEnabled: true,
                  mapObjects: mapObjects,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              'Описание',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              child: Text(
                info.description,
                style: GoogleFonts.montserrat(
                    color: const Color(0xFF6486868), fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget AllWithBackEnd(RestInfoResponce restInfoResponce) {
    return Container(
      color: const Color(0xFF282828),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xFF282828),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    top: 10,
                  ),
                  child: Text(
                    restInfoResponce.name,
                    style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 132, 131, 129),
                  height: 10,
                  indent: 0,
                  thickness: 0.5,
                  endIndent: 0,
                ),
                mainInfo(restInfoResponce),
                const Divider(
                  color: Color.fromARGB(255, 132, 131, 129),
                  height: 10,
                  indent: 0,
                  thickness: 0.5,
                  endIndent: 0,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: AddToFavorite(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<RestInfoResponce>(
        builder: (context, snapshot) => snapshot.hasData
            ? AllWithBackEnd(snapshot.data!)
            : const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFBF5AF2),
                ),
              ),
        future: getInfoPage(),
      ),
    );
  }
}
