import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_app/model/all_job_response_model.dart';
import 'package:test_app/model/signin_response.dart';
import 'package:test_app/model/signup_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/view/homepage.dart';
import 'package:test_app/view/login_page.dart';

class Controller extends GetxController {
  Future signUp(var email, name, number, password) async {
    var url = Uri.https('career-finder.aaratechnologies.in', '/job/api/signUp');
    var body = {
      'type': 'seeker',
      'email': email,
      'name': name,
      'mno': number,
      'ps': password,
    };
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      final signUpResponseModel = signUpResponseModelFromJson(jsonString);

      Get.snackbar('Message:${signUpResponseModel.message!}',
          'Status:${signUpResponseModel.staus!}',
          snackPosition: SnackPosition.BOTTOM);
      if (signUpResponseModel.staus == 'false') {
        Get.to(const LoginPage());
      }

      return signUpResponseModel.obs;
    } else {
      return null;
    }
  }

  Future signIn(var email, password) async {
    var url = Uri.https('career-finder.aaratechnologies.in', '/job/api/login');
    var body = {
      'type': 'seeker',
      'email': email,
      'ps': password,
    };
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      final signInResponseModel = signInResponseModelFromJson(jsonString);
      Get.snackbar('Message:${signInResponseModel.message!}',
          'Status:${signInResponseModel.staus!}',
          snackPosition: SnackPosition.BOTTOM);
      if (signInResponseModel.message == 'please verify your email address') {
        Get.to(HomePage());
      }
      return signInResponseModel.obs;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchOnlyData();
  }

  var data = <Datum>[].obs;

  void fetchOnlyData() async {
    var fetchData = await fetchApi();
    List<Datum> onlyData = fetchData.data;
    data.value = onlyData;
  }

  Future fetchApi() async {
    var url =
        Uri.https('career-finder.aaratechnologies.in', '/job/api/all_job');
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      final rr = jobModelFromJson(jsonString);

      return rr;
    } else {
      return null;
    }
  }
}
