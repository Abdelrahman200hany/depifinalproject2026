class MessageEntity {
  final String messageId;

  final String senderId;
  final String receiverId;

  final String message;

  final DateTime createdAt;

  final bool isRead;

  MessageEntity({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.createdAt,
    this.isRead = false,
  });

  MessageEntity copyWith({
    String? messageId,
    String? senderId,
    String? receiverId,
    String? message,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return MessageEntity(
      messageId: messageId ?? this.messageId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}