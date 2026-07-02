import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/chat/presentation/manager/get_user_chats/get_user_chats_cubit.dart';
import 'package:depifinalproject/feature/chat/presentation/manager/get_user_chats/get_user_chats_state.dart';
import 'package:depifinalproject/feature/chat/presentation/views/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.currentUserId});

  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<GetUserChatsCubit>()..getChats(userId: currentUserId),
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
              if (state.chats.isEmpty) {
                return const Center(child: Text("لا توجد محادثات"));
              }

              return ListView.builder(
                itemCount: state.chats.length,
                itemBuilder: (context, index) {
                  return ChatItem(
                    chat: state.chats[index],
                    currentUserId: currentUserId,
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
