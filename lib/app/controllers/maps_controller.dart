import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  late GoogleMapController gmapsController;
  var initialCameara = CameraPosition(
    target: LatLng(-7.9584, 112.60048),
    zoom: 11,
  );

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    gmapsController.dispose();
  }
}
