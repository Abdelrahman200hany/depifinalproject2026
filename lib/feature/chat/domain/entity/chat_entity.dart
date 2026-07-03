class ChatEntity {
  final String chatId;
  final String orderId;

  final String clientId;
  final String deliveryId;

  final String clientName;
  final String deliveryName;

  final String clientImage;
  final String deliveryImage;

  final List<String> members;

  final String lastMessage;
  final DateTime? lastMessageTime;
  final String lastSenderId;

  final int unreadForClient;
  final int unreadForDelivery;

  ChatEntity({
    required this.chatId,
    required this.orderId,
    required this.clientId,
    required this.deliveryId,
    required this.clientName,
    required this.deliveryName,
    required this.clientImage,
    required this.deliveryImage,
    required this.members,
    this.lastMessage = '',
    this.lastMessageTime,
    this.lastSenderId = '',
    this.unreadForClient = 0,
    this.unreadForDelivery = 0,
  });

  ChatEntity copyWith({
    String? chatId,
    String? orderId,
    String? clientId,
    String? deliveryId,
    String? clientName,
    String? deliveryName,
    String? clientImage,
    String? deliveryImage,
    List<String>? members,
    String? lastMessage,
    DateTime? lastMessageTime,
    String? lastSenderId,
    int? unreadForClient,
    int? unreadForDelivery,
  }) {
    return ChatEntity(
      chatId: chatId ?? this.chatId,
      orderId: orderId ?? this.orderId,
      clientId: clientId ?? this.clientId,
      deliveryId: deliveryId ?? this.deliveryId,
      clientName: clientName ?? this.clientName,
      deliveryName: deliveryName ?? this.deliveryName,
      clientImage: clientImage ?? this.clientImage,
      deliveryImage: deliveryImage ?? this.deliveryImage,
      members: members ?? this.members,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      lastSenderId: lastSenderId ?? this.lastSenderId,
      unreadForClient: unreadForClient ?? this.unreadForClient,
      unreadForDelivery: unreadForDelivery ?? this.unreadForDelivery,
    );
  }
}