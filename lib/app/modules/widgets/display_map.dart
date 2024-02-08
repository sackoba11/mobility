import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mobility/app/constants/app%20string/app_string.dart';

import '../../assets/assets.gen.dart';
import '../../models/routes_model/data_model.dart';

class DisplayMap extends StatefulWidget {
  final Position source;
  final Position? destination;
  const DisplayMap({super.key, required this.source, this.destination});

  @override
  State<DisplayMap> createState() => _DisplayMapState();
}

class _DisplayMapState extends State<DisplayMap> {
  late mapbox.MapboxMap? _mapController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Center(
                  child: mapbox.MapWidget(
                      mapOptions: mapbox.MapOptions(
                          optimizeForTerrain: true, pixelRatio: 1.5),
                      onMapCreated: _onMapCreated,
                      cameraOptions: mapbox.CameraOptions(
                          anchor: ScreenCoordinate(x: 1, y: 1),
                          center:
                              mapbox.Point(coordinates: widget.source).toJson(),
                          zoom: 14.5),
                      resourceOptions: mapbox.ResourceOptions(
                          accessToken: AppString.pkkeyMapBox)),
                )),
          ),
        ),
        Expanded(child: Container())
      ],
    );
  }

  void _onMapCreated(mapbox.MapboxMap? controller) async {
    _mapController = controller;
    _mapController!.location
        .updateSettings(LocationComponentSettings(enabled: true));
    final routes = widget.destination != null ? (await getRoutes()) : null;

    // Position source
    final imageBytesSource =
        (await rootBundle.load(Assets.stop.path)).buffer.asUint8List();
    final pointManagerSource =
        await _mapController?.annotations.createPointAnnotationManager();

    pointManagerSource?.create(mapbox.PointAnnotationOptions(
        geometry: mapbox.Point(coordinates: widget.source).toJson(),
        iconSize: .4,
        image: imageBytesSource));

// Position destination
    final imageBytesDestination =
        (await rootBundle.load(Assets.stop.path)).buffer.asUint8List();

    final pointManagerdestination =
        await _mapController?.annotations.createPointAnnotationManager();

    widget.destination != null
        ? pointManagerdestination?.create(mapbox.PointAnnotationOptions(
            geometry: mapbox.Point(coordinates: widget.destination!).toJson(),
            iconSize: .4,
            image: imageBytesDestination))
        : null;

//Polyline
    var polyline =
        await _mapController?.annotations.createPolylineAnnotationManager();
    widget.destination != null
        ? polyline?.create(
            PolylineAnnotationOptions(
              geometry: LineString(
                coordinates: [for (var i in routes!) Position(i[0], i[1])],
              ).toJson(),
              lineWidth: 3.0,
            ),
          )
        : null;
  }

  Future<List<dynamic>> getRoutes() async {
    Uri url = Uri.parse(
      "https://api.mapbox.com/directions/v5/mapbox/walking/${widget.source.lng},${widget.source.lat};${widget.destination!.lng},${widget.destination!.lat}?steps=true&geometries=geojson&access_token=${AppString.pkkeyMapBox})}",
    );
    final response = await get(url);
    final result = jsonDecode(response.body);
    final routes = DataModel.fromJson(result);
    final distance =
        routes.routes?.expand((route) => route.legs ?? []).toList() ?? [];
    final formattedCoordinates = routes.routes
            ?.expand((route) => route.geometry?.coordinates ?? [])
            .toList() ??
        [];
    print(distance);
    return formattedCoordinates;
  }

  // https://api.mapbox.com/geocoding/v5/mapbox.places/universit.json?country=ci&proximity=-73.990593%2C40.740121&language=fr&access_token=pk.eyJ1Ijoic2Fja29iYSIsImEiOiJjbG1jcGFycnkwZ2gzM2psa2RqYW54OTAxIn0.7A-Ln_rc9SjCsWKN20e9yQ
}
