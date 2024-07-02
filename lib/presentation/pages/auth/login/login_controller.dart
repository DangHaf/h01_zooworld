import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/config/export/config_export.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/utils/look_up_data.dart';
import 'package:template/data/data_source/dio/dio_client.dart';
import 'package:template/data/model/auth/auth_request.dart';
import 'package:template/data/model/auth/auth_response.dart';
import 'package:template/data/model/countries/country_model.dart';
import 'package:template/data/model/provider/provider_model.dart';
import 'package:template/data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  final DioClient _dioClient = GetIt.I.get<DioClient>();

  TextEditingController storeCode = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusNode focusNodeStoreCode = FocusNode();
  FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  RxBool ignoring = false.obs;

  final Rx<Country> _country = LookUpData.country.obs;

  Country get country => _country.value;
  TextEditingController searchDialCode = TextEditingController();

  PhoneCountry? phoneCountry;

  final RxBool _isRemember = false.obs;

  bool get isRemember => _isRemember.value;
  late ProviderModel store;

  @override
  void onInit() {
    super.onInit();
    _getDataRemember();
    if (Get.arguments != null && Get.arguments['store'] != null) {
      store = Get.arguments['store'] as ProviderModel;
    }
  }

  Future<void> onLogin() async {
    if (isValidLogin) {
      ignoring.value = true;
      await _checkPhone();
      ignoring.value = false;
      if (phoneCountry != null) {
        if (!phoneCountry!.isValid) {
          IZIAlert().error(message: 'Invalid phone number'.tr);
        } else {
          ignoring.value = true;
          EasyLoading.show(status: 'Signing in...'.tr);
          final LoginRequest authRequest = LoginRequest(
            storeCode: int.parse(storeCode.text),
            phone: phoneCountry!.phoneNumber!,
            password: password.text.trim(),
            idStore: store.id!,
          );
          await _authRepository.signInPhone(
            data: authRequest,
            onSuccess: (data) async {
              await saveData(data);
              Get.offAllNamed(AppRoute.DASH_BOARD);
            },
            onError: (error) {
              IZIAlert().error(message: error.toString());
            },
          );
          EasyLoading.dismiss();
          ignoring.value = false;
        }
      }
    }
  }

  Future<void> saveData(AuthResponse data) async {
    await sl<SharedPreferenceHelper>().setIdUser(idUser: data.user!.id!);
    await sl<SharedPreferenceHelper>().setIsLogged(isLogged: true);
    await sl<SharedPreferenceHelper>()
        .setRefreshToken(data.refreshToken.toString());
    await sl<SharedPreferenceHelper>().setJwtToken(data.accessToken.toString());
    await _dioClient.refreshToken();
    await sl<SharedPreferenceHelper>()
        .setIdStore(idStore: data.user?.idStore?.id ?? '');
    await sl<SharedPreferenceHelper>()
        .setUserPhoneNumber(userPhoneNumber: data.user?.phone ?? '');
    _saveDataRemember();
  }

  Future<void> _checkPhone() async {
    EasyLoading.show(status: 'Checking phone number...'.tr);
    await _authRepository.checkPhone(
      phoneNumber: phoneNumber.text.trim(),
      country: country.alpha2Code!,
      onSuccess: (data) {
        phoneCountry = data;
      },
      onError: (error) {
        IZIAlert().error(message: error.toString());
      },
    );
    EasyLoading.dismiss();
  }

  set country(Country country) {
    _country.value = country;
  }

  bool get isValidLogin {
    if (storeCode.text.isEmpty) {
      IZIAlert().error(message: 'Store code is required.'.tr);
      return false;
    }
    if (phoneNumber.text.isEmpty) {
      IZIAlert().error(message: 'Phone number is required.'.tr);
      return false;
    }
    if (password.text.isEmpty) {
      IZIAlert().error(message: 'Password is required.'.tr);
      return false;
    }
    if (password.text.trim().length < 6) {
      IZIAlert().error(message: 'Password must have at least 6 characters.'.tr);
      return false;
    }
    return true;
  }

  set isRemember(bool value) {
    _isRemember.value = value;
  }

  void _saveDataRemember() {
    sl<SharedPreferenceHelper>().setIsRemember(value: isRemember);
    if (isRemember) {
      sl<SharedPreferenceHelper>().setPhoneNumber(phoneNumber.text.trim());
      sl<SharedPreferenceHelper>().setCountry(country.dialCode!);
      sl<SharedPreferenceHelper>().setAlpha2Code(country.alpha2Code!);
      sl<SharedPreferenceHelper>().setPassword(password.text.trim());
    } else {
      sl<SharedPreferenceHelper>().removeCountry();
      sl<SharedPreferenceHelper>().removePassword();
      sl<SharedPreferenceHelper>().removePhoneNumber();
    }
  }

  void _getDataRemember() {
    final bool dataSave = sl<SharedPreferenceHelper>().getIsRemember;
    if (dataSave) {
      _isRemember.value = dataSave;
      phoneNumber.text = sl<SharedPreferenceHelper>().getPhoneNumber ?? '';
      password.text = sl<SharedPreferenceHelper>().getPassword ?? '';
      final countryCode = sl<SharedPreferenceHelper>().getCountry;
      final alpha2Code = sl<SharedPreferenceHelper>().getAlpha2Code;
      if (countryCode != null) {
        for (int i = 0; i < LookUpData.countryList.length; i++) {
          if (LookUpData.countryList[i].dialCode == countryCode &&
              LookUpData.countryList[i].alpha2Code == alpha2Code) {
            country = LookUpData.countryList[i];
            update();
            break;
          }
        }
      }
    }
  }
}
