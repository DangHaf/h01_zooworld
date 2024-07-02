import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/data/model/address/address_model.dart';

class ProviderResponse {
  final List<ProviderModel> result;
  final int totalResults;
  final int totalPages;

  ProviderResponse({
    this.result = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });

  factory ProviderResponse.fromJson(Map<String, dynamic> json) {
    return ProviderResponse(
      result: (json['results'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  ProviderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPages: json['totalPages'] as int? ?? 0,
      totalResults: json['totalResults'] as int? ?? 0,
    );
  }
}

class ProviderModel {
  final String? id;
  final String? businessPhone;
  final String? name;
  final String? thumbnail;
  final String? banner;
  final String? address;
  final String? city;
  final String? state;
  final OwnerModel? idOwner;
  final List<String> likes;
  final int? totalRateSupplier;
  final String introduce;
  final int? countRate;
  final num averagePointSupplier;
  final num? rewardPointCoefficient;
  final num? receivePointFromShare;
  final String? linkDownload;
  final String? linkDownloadNailSupply;
  StateModel? idState;
  CityModel? idCity;
  String? countryCode;
  num? taxPercent;
  String? tokenizationKeyBraintree;
  String? merchantIDBraintree;
  String? publicKeyBraintree;
  String? privateKeyBraintree;
  String? timezoneApp;

  ProviderModel({
    this.id,
    this.businessPhone,
    this.name,
    this.thumbnail,
    this.banner,
    this.address,
    this.idOwner,
    this.city,
    this.state,
    this.likes = const [],
    this.totalRateSupplier,
    this.introduce = '',
    this.countRate,
    this.averagePointSupplier = 0,
    this.linkDownload,
    this.rewardPointCoefficient,
    this.receivePointFromShare,
    this.linkDownloadNailSupply,
    this.idState,
    this.idCity,
    this.countryCode,
    this.taxPercent,
    this.tokenizationKeyBraintree,
    this.merchantIDBraintree,
    this.publicKeyBraintree,
    this.privateKeyBraintree,
    this.timezoneApp,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['_id'] as String?,
      businessPhone: json['businessPhone'] as String?,
      thumbnail: json['thumbnail'] as String?,
      banner: json['banner'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      address: json['address'] as String?,
      idOwner:
          json['idOwner'] != null && json['idOwner'].toString().length != 24
              ? OwnerModel.fromJson(json['idOwner'] as Map<String, dynamic>)
              : null,
      likes: json['likes'] != null
          ? List<String>.from(json['likes'] as List<dynamic>)
          : [],
      totalRateSupplier: json['totalRateSupplier'] as int? ?? 0,
      introduce: json['introduce'] as String? ?? '',
      countRate: json['countRate'] as int? ?? 0,
      averagePointSupplier: json['averagePointSupplier'] as num? ?? 0,
      linkDownload: json['linkDownload'] as String?,
      linkDownloadNailSupply: json['linkDownloadNailSupply'] as String?,
      rewardPointCoefficient: json['rewardPointCoefficient'] as num?,
      receivePointFromShare: json['receivePointFromShare'] as num?,
      idState:
          json['idState'] != null && json['idState'].toString().length != 24
              ? StateModel.fromJson(json['idState'] as Map<String, dynamic>)
              : null,
      idCity: json['idCity'] != null && json['idCity'].toString().length != 24
          ? CityModel.fromJson(json['idCity'] as Map<String, dynamic>)
          : null,
      countryCode: json['countryCode'] as String?,
      taxPercent: json['taxPercent'] as num?,
      tokenizationKeyBraintree: json['tokenizationKeyBraintree'] as String?,
      publicKeyBraintree: json['publicKeyBraintree'] as String?,
      merchantIDBraintree: json['merchantIDBraintree'] as String?,
      privateKeyBraintree: json['privateKeyBraintree'] as String?,

      timezoneApp: json['timezoneApp'] as String?,
    );
  }

  String get addressWithCityState {
    return '$address, $city, $state';
  }

  String get contact {
    return '${'home_022'.tr}: ${idOwner?.fullName}';
  }

  bool get isLike => likes.contains(sl<SharedPreferenceHelper>().getIdUser);
}

class OwnerModel {
  final String? id;
  final String? fullName;
  final String? avatar;

  OwnerModel({
    this.id,
    this.fullName,
    this.avatar,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
    );
  }
}
