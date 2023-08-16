import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class Partys extends StatefulWidget {
  const Partys({super.key});

  @override
  State<Partys> createState() => _PartysState();
}

class _PartysState extends State<Partys> {
  GlobalKey mapKey = GlobalKey();
  late YandexMapController controller;

  final List<MapObject> mapObjects = [];

  Future<bool> get locationPermissionNotGranted async =>
      !(await Permission.location.request().isGranted);

  void _showMessage(BuildContext context, Text text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: text));
  }

  Completer<YandexMapController> _completer = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        logoAlignment: const MapAlignment(
            horizontal: HorizontalAlignment.right,
            vertical: VerticalAlignment.bottom),
        nightModeEnabled: true,
        key: mapKey,
        onMapCreated: (YandexMapController yandexMapController) async {
          controller = yandexMapController;
        },
        onUserLocationAdded: (UserLocationView view) async {
          return view.copyWith(
              pin: view.pin.copyWith(
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                        'assets/mapimages/userloc.png'),
                  ),
                ),
              ),
              arrow: view.arrow.copyWith(
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                      'assets/mapimages/arrow.png',
                    ),
                  ),
                ),
              ),
              accuracyCircle: view.accuracyCircle.copyWith(
                  fillColor: const Color(0xFFBF5AF2).withOpacity(0.5)));
        },
      ),
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 150,
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () async {
              if (await locationPermissionNotGranted) {
                _showMessage(
                    context, const Text('Нужно разрешение на геолокацию'));
                return;
              }
              final mediaQuery = MediaQuery.of(context);
              final height = mapKey.currentContext!.size!.height *
                  mediaQuery.devicePixelRatio;
              final width = mapKey.currentContext!.size!.width *
                  mediaQuery.devicePixelRatio;
              await controller.toggleUserLayer(
                  visible: true,
                  autoZoomEnabled: true,
                  anchor: UserLocationAnchor(
                      course: Offset(0.5 * width, 0.5 * height),
                      normal: Offset(0.5 * width, 0.5 * height)));
            },
            child: const Icon(Icons.place_outlined),
          ),
        ),
      ]),
    );
  }
}
