import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.messageId,
    required super.senderId,
    required super.receiverId,
    required super.message,
    required super.createdAt,
    super.isRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      isRead: json['isRead'] ?? false,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'createdAt': Timestamp.fromDate(createdAt),
      'isRead': isRead,
    };
  }

  factory MessageModel.fromEntity(MessageEntity entity) {
    return MessageModel(
      messageId: entity.messageId,
      senderId: entity.senderId,
      receiverId: entity.receiverId,
      message: entity.message,
      createdAt: entity.createdAt,
      isRead: entity.isRead,
    );
  }
}