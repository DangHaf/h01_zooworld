
class SettingModel {
  final String? id;
  final String? linkAndroid;
  final String? linkIos;
  final bool isOTPRegister;
  final bool isOTPForget;
  final bool isOTPUpdate;
  final String? linkShareNailSupply;
  final num? taxPercent;
  final int maxLengthImageProduct;
  final String? tokenizationKeyBraintree;
  final String? userManualPaymentFile;

  SettingModel({
    this.id,
    this.linkAndroid,
    this.tokenizationKeyBraintree,
    this.userManualPaymentFile,
    this.linkIos,
    this.isOTPRegister = false,
    this.isOTPForget = false,
    this.isOTPUpdate = false,
    this.linkShareNailSupply,
    this.taxPercent,
    this.maxLengthImageProduct = 5,
  });

  factory SettingModel.fromJson(Map<String, dynamic> map) {
    return SettingModel(
      id: map['id'] as String?,
      linkAndroid: map['linkAndroid'] as String?,
      linkIos: map['linkIos'] as String?,
      tokenizationKeyBraintree: map['tokenizationKeyBraintree'] as String?,
      userManualPaymentFile: map['userManualPaymentFile'] as String?,
      isOTPRegister: map['isOTPRegister'] as bool? ?? false,
      isOTPForget: map['isOTPForget'] as bool? ?? false,
      isOTPUpdate: map['isOTPUpdate'] as bool? ?? false,
      linkShareNailSupply: map['linkShareNailSupply'] as String?,
      taxPercent: map['taxPercent'] as num?,
      maxLengthImageProduct: map['maxLengthImageProduct'] as int? ?? 5,
    );
  }
}
