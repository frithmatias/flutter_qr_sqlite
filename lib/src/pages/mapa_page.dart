import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qrreader/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;
    Completer<GoogleMapController> _controller = Completer();
    MapType mapType = MapType.normal;

    final CameraPosition posicionInicial =
        CameraPosition(target: scan.getLatLng(), zoom: 18, tilt: 50);

    Set<Marker> markers = new Set<Marker>();
    markers.add(
        new Marker(markerId: MarkerId('mi-casa'), position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(title: Text('Mapa'), actions: [
        IconButton(
            icon: Icon(Icons.location_on_sharp),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: scan.getLatLng(), zoom: 18, tilt: 50)));
            })
      ]),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: markers,
        mapType: MapType.normal,
        initialCameraPosition: posicionInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
        child: Icon(Icons.layers),
      ),
    );
  }
}
