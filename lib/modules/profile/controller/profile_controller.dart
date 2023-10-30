import 'package:get/get.dart';
import 'package:peanut_api/modules/profile/model/profile_model.dart';
import 'package:peanut_api/modules/profile/repository/profile_repo.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profle = ProfileModel().obs;
  var lastDigit = ''.obs;

  Future<ProfileModel> getProfileData() async {
    isLoading.value = true;
    var response = await ProfileRepo.getProfile();
    profle.value = response;
    isLoading.value = false;
    return profle.value;
  }

  void getPhoneNumber() async {
    isLoading.value = true;
    var data = await ProfileRepo.getPhoneNumber();
    lastDigit.value = data;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getProfileData();
    getPhoneNumber();
    super.onInit();
  }
}
