class SocialRequest {
  String? tokenLogin;
  String lang;
  String typeTokenLogin;
  String? fullName;
  String deviceID;
  String? avatar;
  String appType;

  SocialRequest({
    this.fullName,
    required this.typeTokenLogin,
    required this.deviceID,
    required this.lang,
    this.tokenLogin,
    this.avatar,
    this.appType = 'NAIL_SUPPLY',
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone': fullName,
      'typeTokenLogin': typeTokenLogin,
      'deviceID': deviceID,
      'lang': lang,
      'tokenLogin': tokenLogin,
      'avatar': avatar,
      'appType': appType,
    };
  }
}

class LoginRequest {
  int storeCode;
  String password;
  String phone;
  String idStore;

  LoginRequest({
    required this.phone,
    required this.password,
    required this.idStore,
    required this.storeCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
      'storeCode': storeCode,
      'idStore': idStore,
    };
  }
}

class RegisterRequest {
  String fullName;
  String? nickName;
  String phone;
  String countryCode;
  String? email;
  String? address;
  String password;
  String? otpCode;
  String appType;

  RegisterRequest({
    required this.fullName,
    this.nickName,
    required this.phone,
    required this.countryCode,
    this.email,
    this.address,
    required this.password,
    this.otpCode,
    this.appType = 'NAIL_SUPPLY',
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullName': fullName,
      'nickName': nickName,
      'phone': phone,
      'countryCode': countryCode,
      'email': email,
      'address': address,
      'password': password,
      if (otpCode != null) 'otpCode': otpCode,
      'appType': appType,
    };
  }
}

class OTPRequest {
  String phone;

  OTPRequest({
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone': phone,
    };
  }
}

class ResetPassWordRequest {
  String password;
  String phone;
  String? otpCode;
  String storeUserType;

  ResetPassWordRequest({
    required this.phone,
    required this.password,
    this.otpCode,
    required this.storeUserType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
      'storeUserType': storeUserType,
      if (otpCode != null) 'otpCode': otpCode,
    };
  }
}
