import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:template/config/export/config_export.dart';
import 'package:template/core/di_container.dart';
import 'package:template/core/helper/izi_alert.dart';
import 'package:template/core/shared_pref/shared_preference_helper.dart';
import 'package:template/data/data_source/dio/dio_client.dart';
import 'package:template/data/model/auth/auth_response.dart';
import 'package:template/data/repositories/account_repository.dart';
import 'package:template/data/repositories/auth_repository.dart';

class AccountController extends GetxController {
  final DioClient _dioClient = GetIt.I.get<DioClient>();

  GoogleSignIn googleSignIn = GoogleSignIn();
  final AccountRepository _accountRepository = GetIt.I.get<AccountRepository>();
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  RxBool ignoring = false.obs;
  final RxString _language = ''.obs;

  String get language => _language.value;

  RxString key = ''.obs;

  /// User
  final Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  String currentUser = sl<SharedPreferenceHelper>().getIdUser;

  @override
  void onInit() {
    if (sl<SharedPreferenceHelper>().getLocale == 'vi') {
      key.value = 'vi';
      _language.value = 'Vietnamese';
    } else {
      key.value = 'en';
      _language.value = 'English';
    }
    getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    if (sl<SharedPreferenceHelper>().getIdUser.isEmpty) {
      return;
    }
    await _accountRepository.getUser(
      onSuccess: (data) {
        _user.value = data;
      },
      onError: (error) {},
    );
  }

  Future<void> logout() async {
    ignoring.value = true;
    EasyLoading.show(status: 'account_018'.tr);
    await _authRepository.signOut(
      onSuccess: () {
        sl<SharedPreferenceHelper>().removeIdUser();
        sl<SharedPreferenceHelper>().removeLogged();
        sl<SharedPreferenceHelper>().removeRefreshToken();
        sl<SharedPreferenceHelper>().removeJwtToken();
        Get.offAllNamed(AppRoute.DASH_BOARD);
        googleSignIn.signOut();
      },
      onError: (error) {
        IZIAlert().error(message: error.toString());
      },
    );
    ignoring.value = false;
    EasyLoading.dismiss();
  }

  Future<void> deleteAccount() async {
    ignoring.value = true;
    EasyLoading.show(status: 'account_015'.tr);
    await _accountRepository.deleteUser(onSuccess: () {
      IZIAlert().success(message: 'account_063'.tr);
      sl<SharedPreferenceHelper>().removeIdUser();
      sl<SharedPreferenceHelper>().removeLogged();
      sl<SharedPreferenceHelper>().removeRefreshToken();
      sl<SharedPreferenceHelper>().removeJwtToken();
      Get.offAllNamed(AppRoute.DASH_BOARD);
      googleSignIn.signOut();
      _dioClient.resetLang();
    }, onError: (error) {
      IZIAlert().error(message: error.toString());
    });
    ignoring.value = false;
    EasyLoading.dismiss();
  }

  Future<void> changeLanguage(String language, String key) async {
    _accountRepository.updateLanguageUser(
      lang: key,
      onSuccess: () {},
      onError: (_) {},
    );
    _language.value = language;
    this.key.value = key;
    await sl<SharedPreferenceHelper>().setLocale(key);
    _dioClient.refreshLang();
  }

  Future<void> refreshData() async {
    getUser();
  }
}
