import 'package:dt917628579_a1_f24/Battery/batteryindicator.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraApp extends StatefulWidget {
 const CameraApp({super.key});

 @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  Future<void> _setupCameraController() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );
      await cameraController?.initialize();
      setState(() {});
    }
  }

 @override
 Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: BatteryIndicator()),
      body: cameraController == null || !cameraController!.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : CameraPreview(cameraController!),
    );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}