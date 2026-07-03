import 'package:flutter/material.dart';

import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/presentation/views/chat_view.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chat, required this.currentUserId});

  final ChatEntity chat;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final bool isClient = currentUserId == chat.clientId;

    final String name = isClient ? chat.deliveryName : chat.clientName;

    final String image = isClient ? chat.deliveryImage : chat.clientImage;

    final int unread = isClient ? chat.unreadForClient : chat.unreadForDelivery;

    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: image.isNotEmpty ? NetworkImage(image) : null,
        child: image.isEmpty ? const Icon(Icons.person) : null,
      ),
      title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        chat.lastMessage ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: unread == 0
          ? null
          : CircleAvatar(
              radius: 12,
              child: Text(
                unread.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatView(
              chat: chat,
              currentUserId: currentUserId,
              isClient: isClient,
            ),
          ),
        );
      },
    );
  }
}
