import 'package:depifinalproject/feature/chat/presentation/views/widgets/chat_icon_buttom.dart.dart';
import 'package:depifinalproject/feature/chat/presentation/views/chat_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/chat/presentation/manager/get_user_chats/get_user_chats_cubit.dart';
import 'package:depifinalproject/feature/chat/presentation/manager/get_user_chats/get_user_chats_state.dart';

class ChatIconWithBadge extends StatelessWidget {
  const ChatIconWithBadge({
    super.key,
    required this.userId,
    required this.isClient,
  });

  final String userId;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetUserChatsCubit>()..getChats(userId: userId),
      child: BlocBuilder<GetUserChatsCubit, GetUserChatsState>(
        builder: (context, state) {
          int unread = 0;

          if (state is GetUserChatsSuccess) {
           unread = state.chats.fold(
  0,
  (sum, chat) => sum + (isClient ? chat.unreadForClient : chat.unreadForDelivery),
);
          }

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChatIconButton(
              unreadCount: unread,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ChatsListView(userId: userId, isClient: isClient),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
