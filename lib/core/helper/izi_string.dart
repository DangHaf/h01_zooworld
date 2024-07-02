import 'dart:math';

mixin IZIString {
  static String get generateRandomString {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    return List.generate(24, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
