import 'dart:developer';

import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/core/app/provider.dart';
import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:e_learning_app/features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart';
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
    _socket.onConnect((data) => log("Connected to socket.io $data"));
    _socket.onConnectError((data) => log('Connect Error!! $data'));
    _socket.onDisconnect((data) => log('Socket.IO server disconnected $data'));
  }

  _joinLesson(String lessonId, String userId) {
    _socket.emit('joinLesson', {
      "lessonId": lessonId,
      "userId": userId,
      "username": GetIt.I<AppProvider>().user.name,
    });
  }

  chatToClient(LessonCommentsStore store) {
    _socket.on('chatToClient', (data) {
      log("Receiving comment...");
      store.addComment(LessonCommentModel.fromMap(data));
      log(store.socketComments.toString());
    });
  }

  chatToServer(String lessonId, LessonCommentModel comment) {
    log("Chatting...");
    final data = {
      "lessonId": lessonId,
      "comment": comment.toMap(),
      // "userId": GetIt.I<AppProvider>().user.id,
      // "username": GetIt.I<AppProvider>().user.name,
    };
    log(data.toString());
    _socket.emit('chatToServer', data);
  }

  leaveLesson(String lessonId) {
    log("leaving lesson $lessonId.....");
    _socket.emit('leaveLesson', {
      "lessonId": lessonId,
    });
  }
}
