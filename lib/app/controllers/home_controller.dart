import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:portapps/app/data/models/wisata_model.dart';
import 'package:portapps/app/data/provider/request.dart';

class HomeController extends GetxController {
  late WisataModels dataWisata;
  var isLoading = true.obs;
  var loadFilter = true.obs;
  var isError = false.obs;
  late List<Datum> recomendation;
  var currentIndex = 0.obs;
  late List listCategory;
  List<Datum> resultFilter = [];
  var nameCategory = ''.obs;
  var idWisata = '';
  var errorMsg = ''.obs;

  var latitude = ''.obs;
  var longitude = ''.obs;
  var address = ''.obs;
  late Position currentPosition;

  void setState(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getLocation();

    try {
      // await http.get(Uri.parse(ApiData.mainUrl + ApiData.wisata));
      var response = await RequestHttp().getMethod();

      if (response.statusCode == 200) {
        if (response.body['error'] == true) {
          //
        } else {
          // load berhasil
          dataWisata = WisataModels.fromJson(response.body);
        }
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }

    recomendation = dataWisata.data
        .where((element) => double.parse(element.rating) >= 4.7)
        .toList();
    listCategory =
        dataWisata.data.expand((element) => element.category).toSet().toList();

    listCategory.insert(0, 'All');
    filter('All');
  }

  filter(String nm_category) {
    if (nm_category == 'All') {
      resultFilter = dataWisata.data;
    } else {
      resultFilter = dataWisata.data
          .where((element) => element.category.contains(nm_category) == true)
          .toList();
    }
    nameCategory.value = nm_category;
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    ).then((Position position) {
      currentPosition = position;
      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = placemarks[0];

      address.value =
          "${place.subAdministrativeArea}, ${place.administrativeArea}";
    } catch (e) {
      print(e);
    }
  }
}
