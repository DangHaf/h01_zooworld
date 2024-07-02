import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const String notificationChannelId = 'p30_channel';
const String FCM_TOPIC_DEFAULT = 'fcm_all';
const String NOTIFICATION_KEY = 'notification_key';
const String NOTIFICATION_TITLE = 'title';
const String NOTIFICATION_BODY = 'body';

Locale localeResolutionCallback(
    Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    return supportedLocales.first;
  }
  for (final supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}

List<LocalizationsDelegate> localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  DefaultCupertinoLocalizations.delegate,
];

const String PasswordAppStore = 'e2a68251d00248f3a60766c922ddb55a';

const String FeaturesToolCollection = 'Featured';
const String AdsConfig = 'ads_config';

// Total time detector.
const int TOTAL_TIME_DETECTOR_GHOST = 25;
const int TIME_PLAY_SOUND_FOUND_GHOST_1 = TOTAL_TIME_DETECTOR_GHOST - 14;
const int TIME_PLAY_SOUND_FOUND_GHOST_2 = TOTAL_TIME_DETECTOR_GHOST - 3;

/// Type token login.
const String GOOGLE = 'GOOGLE';
const String FACEBOOK = 'FACEBOOK';
const String APPLE = 'APPLE';

// ignore: non_constant_identifier_names
final String MAP_KEY = Platform.isAndroid
    ? 'AIzaSyBxSzM2JXY73V6JcCO1CizWojZcxFQJuUM'
    : 'AIzaSyAX6Bc6QBn-C_m_DhG-1kNZ8w5OTw6qm3w';

const String BASE_GEOLOCATOR =
    'https://maps.googleapis.com/maps/api/geocode/json';

const String TEXT_MULTI_LINE =
    ' multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line multiple line';
const String NAIL_SUPPLY = 'NAIL_SUPPLY';

/// type post
const String VOUCHER = 'VOUCHER';
const String REFUND = 'REFUND';

/// Gender
const OTHER = 'OTHER';
const MALE = 'MALE';
const FEMALE = 'FEMALE';

