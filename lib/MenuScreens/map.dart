import 'package:dt917628579_a1_f24/Battery/batteryindicator.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapApp extends StatelessWidget {
  final LatLng _center = const LatLng(33.569664388, -85.108832898);

 const MapApp({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        title: BatteryIndicator(),
        actions: const [
          SignOutButton(),
        ],
    ),
    body: GoogleMap(initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
   ),
   );
 }
}