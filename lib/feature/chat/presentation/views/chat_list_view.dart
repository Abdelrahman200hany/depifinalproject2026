import 'package:depifinalproject/feature/chat/presentation/manager/get_user_chats/get_user_chats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/presentation/manager/get_user_chats/get_user_chats_cubit.dart';
import 'package:depifinalproject/feature/chat/presentation/views/chat_view.dart';

class ChatsListView extends StatelessWidget {
  final String userId;
  final bool isClient;

  const ChatsListView({
    super.key,
    required this.userId,
    required this.isClient,
  });

  String formatTime(DateTime? time) {
    if (time == null) return "";
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  bool isOnline(DateTime? lastMessageTime) {
    if (lastMessageTime == null) return false;

    final diff = DateTime.now().difference(lastMessageTime);
    return diff.inMinutes <= 3;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetUserChatsCubit>()..getChats(userId: userId),
      child: Scaffold(
        appBar: AppBar(title: const Text("المحادثات")),
        body: BlocBuilder<GetUserChatsCubit, GetUserChatsState>(
          builder: (context, state) {
            if (state is GetUserChatsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is GetUserChatsFailure) {
              return Center(child: Text(state.message));
            }

            if (state is GetUserChatsSuccess) {
              final chats = state.chats;

              if (chats.isEmpty) {
                return const Center(child: Text("لا توجد محادثات"));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: chats.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final ChatEntity chat = chats[index];

                  final otherName = isClient
                      ? chat.deliveryName
                      : chat.clientName;

                  final unreadCount = isClient
                      ? chat.unreadForClient
                      : chat.unreadForDelivery;

                  final online = isOnline(chat.lastMessageTime);

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatView(
                            chat: chat,
                            currentUserId: isClient
                                ? chat.clientId
                                : chat.deliveryId,
                            isClient: isClient,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          //  Avatar + online indicator
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                child: Text(
                                  otherName.isNotEmpty ? otherName[0] : "?",
                                ),
                              ),

                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: online ? Colors.green : Colors.grey,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 12),

                          // Name + message
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  otherName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  chat.lastMessage.isEmpty
                                      ? "ابدأ المحادثة"
                                      : chat.lastMessage,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          //  Time + unread
                          Column(
                            children: [
                              if (chat.lastMessageTime != null)
                                Text(
                                  formatTime(chat.lastMessageTime),
                                  style: const TextStyle(fontSize: 12),
                                ),

                              const SizedBox(height: 8),

                              if (unreadCount > 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    unreadCount > 99
                                        ? "99+"
                                        : unreadCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
