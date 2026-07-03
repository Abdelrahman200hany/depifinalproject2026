import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uuid/uuid.dart';

import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';

import '../../manager/send_message/send_message_cubit.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({
    super.key,
    required this.controller,
    required this.chat,
    required this.currentUserId,
  });

  final TextEditingController controller;
  final ChatEntity chat;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: "اكتب رسالة..."),
              ),
            ),
            IconButton(
              onPressed: () {
                final text = controller.text.trim();

                if (text.isEmpty) return;

                final receiverId = currentUserId == chat.clientId
                    ? chat.deliveryId
                    : chat.clientId;

                context.read<SendMessageCubit>().sendMessage(
                  chatId: chat.chatId,
                  message: MessageEntity(
                    messageId: const Uuid().v4(),
                    senderId: currentUserId,
                    receiverId: receiverId,
                    message: text,
                    createdAt: DateTime.now(),
                    isRead: false,
                  ),
                );
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
