import 'package:template/data/model/address/address_model.dart';
import 'package:template/data/model/countries/country_model.dart';
import 'package:template/data/model/setting/setting_model.dart';

class LookUpData {
  LookUpData();

  static SettingModel setting = SettingModel();
  static List<Country> countryList = <Country>[];
  static Country country = Country(
    name: 'United States',
    alpha2Code: 'US',
    alpha3Code: 'USA',
    dialCode: '+1',
    flagUri: 'assets/flags/${'US'.toLowerCase()}.png',
  );

  static List<StateModel> listState = <StateModel>[];
  static List<CityModel> listCity = <CityModel>[];
}
