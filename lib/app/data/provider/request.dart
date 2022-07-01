import 'package:get/get.dart';
import 'package:portapps/app/data/models/api_model.dart';

class RequestHttp extends GetConnect {
  // Get request
  Future<Response> getMethod() => get(ApiData.mainUrl + ApiData.wisata);

  // // Post request
  // Future<Response> postUser(Map data) => post();

}
