// import 'dart:typed_data';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:protobuf/protobuf.dart';

// import '../gen/proto_mapping.dart';
// import '../gen/protos/message.pb.dart';
// import 'proto_service.dart';
// import 'web_socket_service.dart';

// class MessageService {
//   final ProtoHandler _protoHandler = ProtoHandler();
//   final MessageHandler _messageHandler = MessageHandler();

//   // Private constructor
//   MessageService._internal();

//   // Singleton instance
//   static final MessageService _instance = MessageService._internal();

//   // Factory constructor
//   factory MessageService() {
//     return _instance;
//   }

//   void onMessageReceived(WidgetRef ref) {
//     final webSocketNotifier = ref.read(webSocketProvider);
//     final gameNotifier = ref.read(slotMachineProvider);
//     if (webSocketNotifier.messages.isNotEmpty) {
//       // Get the last received message
//       WebSocketMessage messageBytes = webSocketNotifier.messages.last;

//       try {
//         final messageType = cmdToName(messageBytes.cmd);
//         final message =
//             _protoHandler.parseMessage(messageType, messageBytes.data);
//         _messageHandler.handle(message, gameNotifier);
//         // Handle the parsed message
//       } catch (e) {
//         print('Failed to parse message: $e');
//       }
//     }
//   }

//   void sendMessage(WidgetRef ref, int cmd, dynamic message) {
//     final webSocketNotifier = ref.read(webSocketProvider);

//     // 将消息序列化为字节数组
//     Uint8List messageBody = Uint8List.fromList(message.writeToBuffer());

//     int errorCode = 0;

//     // 发送消息
//     webSocketNotifier.sendMessage(messageBody, errorCode, cmd);
//   }
// }

// class MessageHandler {
//   void handle(GeneratedMessage message, SlotMachineProvider provider) {
//     if (message is UserInfoResult) {
//       _handleUserInfoResult(message, provider);
//     } else if (message is FruitPlayResult) {
//       _handleFruitPlayResult(message, provider);
//     } else if (message is BsPlayResult) {
//       _handleBsPlayResult(message, provider);
//     } else {
//       print("Error: Unsupported message type ${message.runtimeType}");
//     }
//   }

//   void _handleUserInfoResult(
//     UserInfoResult message,
//     SlotMachineProvider provider,
//   ) {
//     provider.setCoin(message.balance.toInt());
//   }

//   void _handleFruitPlayResult(
//     FruitPlayResult message,
//     SlotMachineProvider provider,
//   ) {
//     provider.setLights([23, 8, 19, 4, 22]);
//     provider.setCoin(500);
//     provider.setShouldStartSpinning(true);
//   }

//   void _handleBsPlayResult(BsPlayResult message, SlotMachineProvider provider) {
//     // Handle BsPlayResult
//   }
// }
