import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/core/app/provider.dart';
import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

@injectable
class SocketServices {
  late io.Socket _socket;

  initialize(String lessonId) {
    _socket = io.io(
      Env.instance.baseUrl,
      io.OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          // .disableAutoConnect() // disable auto-connection
          // .setExtraHeaders({'foo': 'bar'}) // optional
          .build(),
    );
    _connectToSocket();
    _joinLesson(lessonId, GetIt.I<AppProvider>().user.id);
    // chatToClient();
  }

  _connectToSocket() {
    _socket.onConnect(
        (data) => print("socket_service: Connected to socket.io $data"));
    _socket.onConnectError(
        (data) => print('socket_service: Connect Error!! $data'));
    _socket.onDisconnect(
        (data) => print('socket_service: Socket.IO server disconnected $data'));
  }

  _joinLesson(String lessonId, String userId) {
    _socket.emit('joinLesson', {
      "lessonId": lessonId,
      "userId": userId,
      "username": GetIt.I<AppProvider>().user.name,
    });
  }

  chatToClient(Function(LessonCommentModel) callback) {
    _socket.on('chatToClient', (data) {
      print("socket_service: Receiving comment...");
      print(
          'socket_service: LessonCommentModel: ${LessonCommentModel.fromMap(data)}');
      callback(LessonCommentModel.fromMap(data));
      // store.addComment(LessonCommentModel.fromMap(data));
      // print(store.socketComments.toString());
    });
  }

  chatToServer(String lessonId, LessonCommentModel comment) {
    print("socket_service: Chatting...");
    final data = {
      "lessonId": lessonId,
      "comment": comment.toMap(),
      // "userId": GetIt.I<AppProvider>().user.id,
      // "username": GetIt.I<AppProvider>().user.name,
    };
    print(data.toString());
    _socket.emit('chatToServer', data);
  }

  leaveLesson(String lessonId) {
    print("socket_service: leaving lesson $lessonId.....");
    _socket.emit('leaveLesson', {
      "lessonId": lessonId,
    });
  }
}
