import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/get_messages/get_messages_cubit.dart';
import '../manager/send_message/send_message_cubit.dart';
import '../manager/mark_messages_as_read/mark_messages_as_read_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.chat,
    required this.currentUserId,
    required this.isClient,
  });

  final ChatEntity chat;
  final String currentUserId;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<GetMessagesCubit>()),
        BlocProvider(create: (_) => getIt<SendMessageCubit>()),
        BlocProvider(create: (_) => getIt<MarkMessagesAsReadCubit>()),
      ],
      child: ChatViewBody(
        chat: chat,
        currentUserId: currentUserId,
        isClient: isClient,
      ),
    );
  }
}
