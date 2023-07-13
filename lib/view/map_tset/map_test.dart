
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';
class MapScreen extends StatefulWidget {
  final String? cityName;

  MapScreen({this.cityName});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Set<Polygon> _polygons = {};

  @override
  void initState() {
    super.initState();
  // getCityOutline(widget.cityName!);
    getItalyBoundary();
  }

  Future<void> getCityOutline(String cityName) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$cityName&key=AIzaSyB6Z2qQ5Pcz8juRI-EXVX2ktVwwKKZ1fVw'));
    var data = jsonDecode(response.body);
    print("---->${response.body}");
    List<LatLng> points = [];

    if (data['status'] == 'OK') {
      var geometry = data['results'][0]['geometry']['viewport'];
      var northeast = geometry['northeast'];
      var southwest = geometry['southwest'];

      points.add(LatLng(northeast['lat'], southwest['lng']));
      points.add(LatLng(northeast['lat'], northeast['lng']));
      points.add(LatLng(southwest['lat'], northeast['lng']));
      points.add(LatLng(southwest['lat'], southwest['lng']));
      final List<LatLng> italyCoordinates = [
        LatLng(47.092026, 12.851942), // northwestern-most point
        LatLng(44.928569, 12.528161), // eastern-most point
        LatLng(36.679668, 15.708655), // southern-most point
        LatLng(36.660385, 10.536210), // western-most point
        LatLng(41.861403, 8.894052),  // northern-most point
      ];
      setState(() {
        _polygons.add(
          Polygon(
            polygonId: PolygonId(cityName),
            points: italyCoordinates,
            strokeWidth: 2,
            strokeColor: Colors.red,
            fillColor: Colors.red.withOpacity(0.1),
          ),
        );
      });
    }


  }



  Future<String> loadAsset(name) async {
    return await rootBundle.loadString('asset/${name}.geojson');
  }



  Future getItalyBoundary() async {
    // Get the path for the GeoJSON file
    Directory appDocDir = await getApplicationDocumentsDirectory();
   // String filePath = '${appDocDir.path}/italy.geojson';
   // String filePath = "asset/italy.geojson";
  //  String filePath = await getFileData("asset/italy.geojson");

    // Read the GeoJSON file and convert it to a Map object
    //String fileData = await File(filePath).readAsString();

    String jsonString = await loadAsset("italy");
    Map<String, dynamic> italyMap = json.decode(jsonString);

    // Extract the coordinates field from the Map object
    List<dynamic> coordinates = italyMap['features'][0]['geometry']['coordinates'][0];

    // Convert the coordinates field into a list of LatLng objects
    List<LatLng> italyBoundary = [];
    for (List<dynamic> coordPair in coordinates) {
      italyBoundary.add(LatLng(coordPair[1], coordPair[0]));
    }

    print("italyBoundary$italyBoundary");

   // return italyBoundary;

    setState(() {
      _polygons.add(
        Polygon(
          polygonId: PolygonId("italy"),
          points: italyBoundary,
          strokeWidth: 5,
          strokeColor: Colors.red,
          fillColor: Colors.red.withOpacity(0.1),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        polygons: _polygons,
        initialCameraPosition: CameraPosition(
          target: LatLng(39.19605253321914, 16.964534289932956), // Default map location
          zoom: 11,
        ),
      ),
    );
  }
}