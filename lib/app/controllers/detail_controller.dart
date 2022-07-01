import 'package:get/get.dart';
import 'package:portapps/app/controllers/home_controller.dart';
import 'package:portapps/app/data/models/wisata_model.dart';
import 'package:portapps/app/data/provider/request.dart';

class DetailController extends GetxController {
  final c = Get.find<HomeController>();
  late Datum dataDetail;
  var idWisata = '';
  var isLoading = true.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    // var response = await http.get(Uri.parse(ApiData.mainUrl + ApiData.wisata));
    var response = await RequestHttp().getMethod();

    if (response.statusCode == 200) {
      if (response.body['error'] == true) {
        //
      } else {
        // load berhasil
        var dataGallery = WisataModels.fromJson(response.body);
        dataDetail =
            dataGallery.data.singleWhere((element) => c.idWisata == element.id);
      }
      isLoading.value = false;
    }
  }
}
