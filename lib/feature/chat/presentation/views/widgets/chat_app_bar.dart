import 'package:flutter/material.dart';

import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
    required this.chat,
    required this.currentUserId,
  });

  final ChatEntity chat;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final bool isClient = currentUserId == chat.clientId;

    final String userName = isClient ? chat.deliveryName : chat.clientName;

    final String image = isClient ? chat.deliveryImage : chat.clientImage;

    return AppBar(
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: image.isNotEmpty ? NetworkImage(image) : null,
            child: image.isEmpty ? const Icon(Icons.person) : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              userName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
