import 'package:depifinalproject/feature/chat/presentation/views/widgets/chat_app_bar.dart';
import 'package:depifinalproject/feature/chat/presentation/views/widgets/message_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';

import '../../manager/get_messages/get_messages_cubit.dart';
import '../../manager/get_messages/get_messages_state.dart';

import '../../manager/send_message/send_message_cubit.dart';
import '../../manager/send_message/send_message_state.dart';

import '../../manager/mark_messages_as_read/mark_messages_as_read_cubit.dart';

import 'messages_list_view.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({
    super.key,
    required this.chat,
    required this.currentUserId,
    required this.isClient,
  });

  final ChatEntity chat;
  final String currentUserId;
  final bool isClient;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<GetMessagesCubit>().getMessages(chatId: widget.chat.chatId);

    context.read<MarkMessagesAsReadCubit>().markAsRead(
      chatId: widget.chat.chatId,
      isClient: widget.isClient,
    );
  }

  @override
  void dispose() {
    controller.dispose();
        scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendMessageCubit, SendMessageState>(
      listener: (context, state) {
        if (state is SendMessageSuccess) {
          controller.clear();

          // context.read<GetMessagesCubit>().getMessages(
          //   chatId: widget.chat.chatId,
          // );
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: ChatAppBar(
            chat: widget.chat,
            currentUserId: widget.currentUserId,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<GetMessagesCubit, GetMessagesState>(
                builder: (context, state) {
                  if (state is GetMessagesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is GetMessagesFailure) {
                    return Center(child: Text(state.message));
                  }

                  if (state is GetMessagesSuccess) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (scrollController.hasClients) {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    });

                    return MessagesListView(
                      messages: state.messages,
                      currentUserId: widget.currentUserId,
                      scrollController: scrollController,
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
            MessageInput(
              controller: controller,
              chat: widget.chat,
              currentUserId: widget.currentUserId,
            ),
          ],
        ),
      ),
    );
  }
}
