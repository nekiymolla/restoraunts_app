import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ActualRestInfo extends StatefulWidget {
  const ActualRestInfo({super.key});

  @override
  State<ActualRestInfo> createState() => _ActualRestInfoState();
}

class _ActualRestInfoState extends State<ActualRestInfo> {
  final List<MapObject> mapObjects = [];

  final MapObjectId mapObjectId = const MapObjectId('first_map_object');

  Future<Uint8List> _rawPlaceMarkImage() async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    final size = Size(50, 50);
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final radius = 20.0;

    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  // final mapObject = PlacemarkMapObject(
  //     mapId: mapObjectId,
  //     point: Point(latitude: 51.776272, longitude: 55.099594));

  Widget mainInfo() {
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
              'такой то адрессdasdasdasdasdasd',
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
                'Tommy Gun Tommy Gun Tommy Gun Tommy Gun Tommy Gun Tommy GunTommy Gun Tommy Gun Tommy Gun Tommy Gun Tommy Gun Tommy GunGun Tommy Gun…',
                style: GoogleFonts.montserrat(
                    color: const Color(0xFF6486868), fontSize: 16),
              ),
            ),
          )
        ],
      ),
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
                    'Популярный ресторан',
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
                mainInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
