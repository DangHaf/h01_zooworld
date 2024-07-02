import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/export/core_export.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Token Device
  String get getTokenDevice {
    return _sharedPreference.getString(Preferences.tokenDevice) ?? '';
  }

  void setTokenDevice(String tokenDevice) {
    _sharedPreference.setString(Preferences.tokenDevice, tokenDevice);
  }

  // splash: ----------------------------------------------------------
  bool get isIntroduce {
    return _sharedPreference.getBool(Preferences.isIntroduce) ?? false;
  }

  Future<void> setIsIntroduce({required bool isIntroduce}) async {
    await _sharedPreference.setBool(Preferences.isIntroduce, isIntroduce);
  }

  // General Methods: Access token
  String get getJwtToken {
    return _sharedPreference.getString(Preferences.jwtToken) ?? '';
  }

  Future<void> setJwtToken(String authToken) async {
    await _sharedPreference.setString(Preferences.jwtToken, authToken);
  }

  // General Methods: Access token
  String get refreshToken {
    return _sharedPreference.getString(Preferences.refreshToken) ?? '';
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await _sharedPreference.setString(Preferences.refreshToken, refreshToken);
  }

  // fcm token
  String get getFcmToken {
    return _sharedPreference.getString(Preferences.fcmToken) ?? '';
  }

  void setFcmToken(String fcmToken) {
    _sharedPreference.setString(Preferences.fcmToken, fcmToken);
  }

  //locale
  Future<void> setLocale(String locale) async {
    await _sharedPreference.setString(Preferences.locale, locale);
  }

  // locale
  String get getLocale {
    return _sharedPreference.getString(Preferences.locale) ?? '';
  }

  ///
  /// Time zone.
  ///
  String get getTimeZoneName {
    return _sharedPreference.getString(Preferences.idTimeZoneName) ?? '';
  }

  void setTimeZoneName({required String idTimeZoneName}) {
    _sharedPreference.setString(Preferences.idTimeZoneName, idTimeZoneName);
  }

  Future<bool> removeRefreshToken() {
    return _sharedPreference.remove(Preferences.refreshToken);
  }

  Future<bool> removeJwtToken() {
    return _sharedPreference.remove(Preferences.jwtToken);
  }

  // Loggin: ----------------------------------------------------------
  bool get isLogged {
    return _sharedPreference.getBool(Preferences.isLogged) ?? false;
  }

  Future<void> setIsLogged({required bool isLogged}) async {
    await _sharedPreference.setBool(Preferences.isLogged, isLogged);
  }

  Future<void> removeLogged() async {
    _sharedPreference.remove(Preferences.isLogged);
  }

  ///
  /// Set id user.
  ///
  String get getIdUser {
    return _sharedPreference.getString(Preferences.idUser) ?? '';
  }

  Future<void> setIdUser({required String idUser}) async {
    await _sharedPreference.setString(Preferences.idUser, idUser);
  }

  void removeIdUser() {
    _sharedPreference.remove(Preferences.idUser);
  }

  bool get getIsRemember {
    return _sharedPreference.getBool(Preferences.isRemember) ?? false;
  }

  Future<void> setIsRemember({required bool value}) async {
    await _sharedPreference.setBool(Preferences.isRemember, value);
  }

  Future<void> removeRemember() async {
    await _sharedPreference.remove(Preferences.isRemember);
  }

  String? get getPhoneNumber {
    return _sharedPreference.getString(Preferences.phoneNumber);
  }

  Future<void> setPhoneNumber(String value) async {
    await _sharedPreference.setString(Preferences.phoneNumber, value);
  }

  Future<void> removePhoneNumber() async {
    await _sharedPreference.remove(Preferences.phoneNumber);
  }

  String? get getPassword {
    return _sharedPreference.getString(Preferences.password);
  }

  Future<void> setPassword(String value) async {
    await _sharedPreference.setString(Preferences.password, value);
  }

  Future<void> removePassword() async {
    await _sharedPreference.remove(Preferences.password);
  }

  String? get getCountry {
    return _sharedPreference.getString(Preferences.countryCode);
  }

  Future<void> setCountry(String value) async {
    await _sharedPreference.setString(Preferences.countryCode, value);
  }

  Future<void> removeCountry() async {
    await _sharedPreference.remove(Preferences.countryCode);
  }

  String? get getAlpha2Code {
    return _sharedPreference.getString(Preferences.alpha2Code);
  }

  Future<void> setAlpha2Code(String value) async {
    await _sharedPreference.setString(Preferences.alpha2Code, value);
  }

  bool get getRequestLocation {
    return _sharedPreference.getBool(Preferences.requestLocation) ?? false;
  }

  Future<void> setRequestLocation({bool value = false}) async {
    await _sharedPreference.setBool(Preferences.requestLocation, value);
  }

  List<String> get getListHistorySearch {
    return _sharedPreference
            .getStringList(sl<SharedPreferenceHelper>().getIdUser) ??
        [];
  }

  Future<void> setListHistorySearch(List<String> historySearch) async {
    await _sharedPreference.setStringList(
        sl<SharedPreferenceHelper>().getIdUser, historySearch);
  }

  /// Store
  String get getIdStore {
    return _sharedPreference.getString(Preferences.idStore) ?? '';
  }

  Future<void> setIdStore({required String idStore}) async {
    await _sharedPreference.setString(Preferences.idStore, idStore);
  }

  void removeIdStore() {
    _sharedPreference.remove(Preferences.idStore);
  }

  String get getUserPhoneNumber {
    return _sharedPreference.getString(Preferences.userPhoneNumber) ?? '';
  }

  Future<void> setUserPhoneNumber({required String userPhoneNumber}) async {
    await _sharedPreference.setString(Preferences.userPhoneNumber, userPhoneNumber);
  }

  void removeUserPhoneNumber() {
    _sharedPreference.remove(Preferences.userPhoneNumber);
  }
}
