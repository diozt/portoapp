import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portapps/app/controllers/maps_controller.dart';

class MapScreen extends StatelessWidget {
  final c = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: c.initialCameara,
        onMapCreated: (controller) => c.gmapsController = controller,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.gmapsController.animateCamera(
          CameraUpdate.newCameraPosition(c.initialCameara),
        ),
        backgroundColor: HexColor('FF5733'),
        foregroundColor: Colors.white,
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }
}
