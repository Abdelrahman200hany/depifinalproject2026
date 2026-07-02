import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';

import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';
import 'package:depifinalproject/feature/chat/data/model/chat_model.dart';
import 'package:depifinalproject/feature/chat/data/model/message_model.dart';

import 'package:depifinalproject/feature/chat/domain/repo/chat_repo.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

class ChatRepoImpl implements ChatRepo {
  final DataBaseServies dataBaseServies;

  ChatRepoImpl(this.dataBaseServies);

  String _generateChatId(String clientId, String deliveryId, String orderId) {
    return "${orderId}_${clientId}_$deliveryId";
  }

  // =========================
  // Create or Get Chat
  // =========================
  @override
  Future<Either<Failure, ChatEntity>> getOrCreateChat({
    required OrderEntity order,
  }) async {
    try {
      final chatId = _generateChatId(
        order.createdBy,
        order.deliveryId,
        order.uIdOrder,
      );

      final exists = await dataBaseServies.chekedDataIfExitsinDatabase(
        path: "chats",
        deumentID: chatId,
      );

      if (exists) {
        final data = await dataBaseServies.readData(
          path: "chats",
          documentID: chatId,
        );

        return Right(ChatModel.fromJson(data));
      }

      final chat = ChatModel(
        chatId: chatId,
        orderId: order.uIdOrder,
        clientId: order.createdBy,
        deliveryId: order.deliveryId,
        clientName: order.senderName,
        deliveryName: order.deliveryName,
        clientImage: "",
        deliveryImage: "",
        members: [order.createdBy, order.deliveryId],
        lastMessage: "",
        lastSenderId: "",
        unreadForClient: 0,
        unreadForDelivery: 0,
        lastMessageTime: null,
      );

      await dataBaseServies.addData(
        path: "chats",
        documentID: chatId,
        data: chat.toJson(),
      );

      return Right(chat);
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ أثناء إنشاء المحادثة"));
    }
  }

  // =========================
  // 🔥 GET USER CHATS (STREAM)
  // =========================
  @override
  Stream<Either<Failure, List<ChatEntity>>> getUserChats({
    required String userId,
  }) {
    try {
      return dataBaseServies
          .streamCollectionWhere(path: "chats", field: "members", value: userId)
          .map((data) {
            final chats = data.map((e) => ChatModel.fromJson(e)).toList();
            return Right(chats);
          });
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: "تعذر تحميل المحادثات")));
    }
  }

  // =========================
  // Send Message
  // =========================
  @override
  Future<Either<Failure, void>> sendMessage({
    required String chatId,
    required MessageEntity message,
  }) async {
    try {
      final msg = MessageModel.fromEntity(message);

      // إضافة الرسالة
      await dataBaseServies.addSubCollectionData(
        path: "chats",
        docId: chatId,
        subCollection: "messages",
        data: msg.toJson(),
        subDocId: msg.messageId,
      );

      // قراءة بيانات المحادثة لمعرفة هل المرسل عميل أم مندوب
      final chatData = await dataBaseServies.readData(
        path: "chats",
        documentID: chatId,
      );

      final chat = ChatModel.fromJson(chatData);

      final bool senderIsClient = msg.senderId == chat.clientId;

      // تحديث آخر رسالة + زيادة عداد الرسائل للطرف الآخر
      await dataBaseServies.upDatadata(
        path: "chats",
        dataId: chatId,
        data: {
          "lastMessage": msg.message,
          "lastSenderId": msg.senderId,
          "lastMessageTime": Timestamp.fromDate(msg.createdAt),

          if (senderIsClient)
            "unreadForDelivery": FieldValue.increment(1)
          else
            "unreadForClient": FieldValue.increment(1),
        },
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "تعذر إرسال الرسالة"));
    }
  }

  // =========================
  // 🔥 GET MESSAGES (STREAM)
  // =========================
  @override
  Stream<Either<Failure, List<MessageEntity>>> getMessages({
    required String chatId,
  }) {
    try {
      return dataBaseServies
          .streamSubCollection(
            path: "chats",
            docId: chatId,
            subCollection: "messages",
          )
          .map((data) {
            final messages = data.map((e) => MessageModel.fromJson(e)).toList();

            return Right(messages);
          });
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: "تعذر تحميل الرسائل")));
    }
  }

  // =========================
  // Mark as Read
  // =========================
  @override
  Future<Either<Failure, void>> markMessagesAsRead({
    required String chatId,
    required bool isClient,
  }) async {
    try {
      final field = isClient ? "unreadForClient" : "unreadForDelivery";

      await dataBaseServies.upDatadata(
        path: "chats",
        dataId: chatId,
        data: {field: 0},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "تعذر تحديث الرسائل"));
    }
  }
}
