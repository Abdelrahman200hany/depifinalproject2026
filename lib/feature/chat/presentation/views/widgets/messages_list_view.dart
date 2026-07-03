import 'package:flutter/material.dart';

import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';

import 'message_bubble.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.messages,
    required this.currentUserId,
    required this.scrollController,
  });

  final List<MessageEntity> messages;
  final ScrollController scrollController;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const Center(child: Text("لا توجد رسائل"));
    }

    return ListView.builder(
      controller: scrollController,
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
