import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:template/core/di_container.dart';
import 'package:template/core/shared_pref/shared_preference_helper.dart';
import 'package:template/core/utils/constants/socket_constant.dart';

class SocketIO {
  final io.Socket socket = io.io(
      SocketConstant.WEB_SOCKET_TEST,
      io.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setExtraHeaders({
        'authorization':
        'Bearer ${sl.get<SharedPreferenceHelper>().getJwtToken}'
      }) // headers
          .enableAutoConnect()
          .build());

  SocketIO() {
    _init();
  }

  ///
  /// _init
  ///
  void _init() {
    if (socket.disconnected) {
      socket.connect();
      socket.onConnect(
            (_) {},
      );
    }
  }
}