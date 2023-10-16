import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';

class LokasiPage extends StatefulWidget {
  @override
  _LokasiPageState createState() => _LokasiPageState();
}

class _LokasiPageState extends State<LokasiPage> {
  MapboxMapController? _mapController;
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Fungsi untuk mendapatkan lokasi saat ini
  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      final currentLocation = await location.getLocation();
      setState(() {
        _currentLocation = currentLocation;
      });
    } catch (e) {
      print('Gagal mendapatkan lokasi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox Peta Lokasi'),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MapboxMap(
          accessToken: 'sk.eyJ1Ijoic2VjeHBsb2l0NyIsImEiOiJjbG5zbTh0eHYxcWc2MnFzNjgzeGZ6NDhhIn0.g63UX0mhItZWJmTG0m5FOw',
          initialCameraPosition: CameraPosition(
            target: LatLng(
              _currentLocation?.latitude ?? 0.0,
              _currentLocation?.longitude ?? 0.0,
            ),
            zoom: 14.0,
          ),
          onMapCreated: (controller) {
            setState(() {
              _mapController = controller;
            });
          },
        ),
      ),
    );
  }
}
