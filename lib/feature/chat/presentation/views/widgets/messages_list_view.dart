import 'package:flutter/material.dart';

import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';

import 'message_bubble.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.messages,
    required this.currentUserId,
  });

  final List<MessageEntity> messages;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const Center(child: Text("لا توجد رسائل"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageBubble(
          message: messages[index],
          isMe: messages[index].senderId == currentUserId,
        );
      },
    );
  }
}
