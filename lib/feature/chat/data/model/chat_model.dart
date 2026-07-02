import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({
    required super.chatId,
    required super.orderId,
    required super.clientId,
    required super.deliveryId,
    required super.clientName,
    required super.deliveryName,
    required super.clientImage,
    required super.deliveryImage,
    required super.members,
    super.lastMessage,
    super.lastMessageTime,
    super.lastSenderId,
    super.unreadForClient,
    super.unreadForDelivery,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chatId'],
      orderId: json['orderId'],
      clientId: json['clientId'],
      deliveryId: json['deliveryId'],
      clientName: json['clientName'],
      deliveryName: json['deliveryName'],
      clientImage: json['clientImage'],
      deliveryImage: json['deliveryImage'],
      members: List<String>.from(json['members'] ?? []),
      lastMessage: json['lastMessage'] ?? '',
      lastSenderId: json['lastSenderId'] ?? '',
      unreadForClient: json['unreadForClient'] ?? 0,
      unreadForDelivery: json['unreadForDelivery'] ?? 0,
      lastMessageTime: json['lastMessageTime'] == null
          ? null
          : (json['lastMessageTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'orderId': orderId,
      'clientId': clientId,
      'deliveryId': deliveryId,
      'clientName': clientName,
      'deliveryName': deliveryName,
      'clientImage': clientImage,
      'deliveryImage': deliveryImage,
      'members': members,
      'lastMessage': lastMessage,
      'lastSenderId': lastSenderId,
      'lastMessageTime': lastMessageTime == null
          ? null
          : Timestamp.fromDate(lastMessageTime!),
      'unreadForClient': unreadForClient,
      'unreadForDelivery': unreadForDelivery,
    };
  }

  factory ChatModel.fromEntity(ChatEntity entity) {
    return ChatModel(
      chatId: entity.chatId,
      orderId: entity.orderId,
      clientId: entity.clientId,
      deliveryId: entity.deliveryId,
      clientName: entity.clientName,
      deliveryName: entity.deliveryName,
      clientImage: entity.clientImage,
      deliveryImage: entity.deliveryImage,
      members: entity.members,
      lastMessage: entity.lastMessage,
      lastSenderId: entity.lastSenderId,
      lastMessageTime: entity.lastMessageTime,
      unreadForClient: entity.unreadForClient,
      unreadForDelivery: entity.unreadForDelivery,
    );
  }
}