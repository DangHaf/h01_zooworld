// ignore_for_file: non_constant_identifier_names

class EndPoint {
  EndPoint._();

  //
  // API.
  static const String BASE_URL = 'https://p30nailtest.izisoft.io/';
  static const String SOCKET_URL = 'wss://socket1.crudcode.tk';

  //
  // Auth.
  static const String signInAccount = '/auth/signin-with-device';

  // Characters.
  static const String character = '/a3-characters';

  // Category.
  static const String category = '/a3-categories';

  // Conversation.
  static const String conversation = '/a3-conversations';

  // messages.
  static const String messages = '/a3-messages';

  // Convert image.
  static const String convertFile = '/messages/upload-file-to-text';

  // Convert file.
  static const String convertImage = '/messages/upload-image-to-text';

  // Settings.
  static const String settings = '/app9-settings/one';

  // Feedback.
  static const String feedback = '/app9-feedbacks';

  // Auth.
  static const String users = '/users';

  // DIY.
  static const String diy = '/a3-diy';

  // Tool collection.
  static const String toolCollection = '/a3-tool-categories';

  // Tool generator.
  static const String toolGenerator = '/a3-tool-categories/use';

  // DIY Chat.
  static const String diyChat = '/a3-diy-messages';

  // Verify Receipt Apple.
  static const String receiptAppleSanBox =
      'https://sandbox.itunes.apple.com/verifyReceipt';
  static const String receiptAppleProduct =
      'https://buy.itunes.apple.com/verifyReceipt';

  // Text to audio.
  static const String textToAudio =
      'http://p55product10test.izisoft.io/text-to-audio';

  static String SING_IN_WITH_SOCIAL = "v1/auth/signin-with-social";
  static String SING_IN_WITH_LOCAL = "v1/auth/signin-local";
  static String SING_UP_WITH_LOCAL = "v1/auth/signup-local";
  static String SEND_OPT_PHONE = "v1/otps/send-otp-phone";
  static String PHONE_COUNTRY = "v1/phone-countries";
  static String SIGN_OUT = "v1/auth/sign-out";
  static String SETTING = "v1/settings";
  static String UPDATE_PASSWORD_PHONE = "v2/users/update-password/phone";
  static String NOTIFICATION = "v1/notifications";
  static String USER = "v2/users";
  static String USER_V1 = "v1/users";
  static String UPLOAD = "v1/uploads";
  static String UPLOAD_LOCAL = "v1/uploads/local-tmp";
  static String STATE = "v1/states";
  static String CITY = "v1/cities";
  static String ADDRESS = "v2/addresses";
  static String ADD_MESSAGES = "v2/messages";
  static String PROVIDER = "/v2/stores/paginate";
}
