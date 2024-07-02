import 'package:get_it/get_it.dart';
import 'package:template/config/export/config_export.dart';
import 'package:template/core/export/core_export.dart';
import 'package:get/get.dart';
import 'package:template/core/utils/look_up_data.dart';
import 'package:template/data/repositories/country_repository.dart';
import 'package:template/data/repositories/lookup_repository.dart';

class SplashController extends GetxController {
  ///
  /// Declare API.
  final LookupRepository _lookupRepository = GetIt.I.get<LookupRepository>();

  bool isAllowShowLoading = true;

  @override
  Future<void> onInit() async {
    super.onInit();
    _getPhoneCountries();
    await Future.wait([
      _getCity(),
      _getState(),
    ]);
    _setStatusLogin();
  }

  ///
  /// check status logged in or not.
  ///
  void _setStatusLogin() {
    Get.offNamed(AppRoute.DASH_BOARD);
    return;
    final _isIntroduce = sl<SharedPreferenceHelper>().isIntroduce;
    final _isLogged = sl<SharedPreferenceHelper>().isLogged;
    if (_isIntroduce) {
      if(_isLogged){
        Get.offNamed(AppRoute.DASH_BOARD);
      }else{
        Get.offNamed(AppRoute.SELECT_STORE);
      }
    } else {
      Get.offNamed(AppRoute.INTRODUCTION);
    }
  }

  void _getPhoneCountries() {
    LookUpData.countryList =
        CountryRepository.getCountriesData(countries: List.empty());
  }

  Future<void> _getState() async {
    int retry = 0;
    await _lookupRepository.getState(
      onSuccess: (data) {
        data.sort((a, b) => a.name.compareTo(b.name));
        LookUpData.listState.clear();
        LookUpData.listState.addAll(data);
      },
      onError: (error) {
        if (retry > 2) {
          return;
        } else {
          _getState();
          retry++;
        }
      },
    );
  }

  Future<void> _getCity() async {
    int retry = 0;
    await _lookupRepository.getCity(
      onSuccess: (data) {
        data.sort((a, b) => a.name.compareTo(b.name));
        LookUpData.listCity.clear();
        LookUpData.listCity.addAll(data);
      },
      onError: (error) {
        if (retry > 2) {
          return;
        } else {
          _getCity();
          retry++;
        }
      },
    );
  }
}
