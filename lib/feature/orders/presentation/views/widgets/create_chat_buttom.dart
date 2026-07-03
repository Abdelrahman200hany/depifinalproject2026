import 'package:depifinalproject/feature/chat/presentation/manager/get_or_create_chat/get_or_create_chat_cubit.dart';
import 'package:depifinalproject/feature/chat/presentation/manager/get_or_create_chat/get_or_create_chat_state.dart';
import 'package:depifinalproject/feature/chat/presentation/views/chat_view.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateChatButtom extends StatelessWidget {
  const CreateChatButtom({
    super.key,
    required this.orderItem,
    required this.isClient,
    required this.createdBy,
  });

  final OrderEntity orderItem;
  final String createdBy;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOrCreateChatCubit, GetOrCreateChatState>(
      listener: (context, state) {
        if (state is GetOrCreateChatSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatView(
                chat: state.chat,
                currentUserId: createdBy,
                isClient: isClient,
              ),
            ),
          );
        }

        if (state is GetOrCreateChatFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: 50,
          height: 50,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: state is GetOrCreateChatLoading
                ? null
                : () {
                    context.read<GetOrCreateChatCubit>().getOrCreateChat(
                      order: orderItem,
                    );
                  },
            child: Center(
              child: state is GetOrCreateChatLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(
                      Icons.message_rounded,
                      color: Colors.green,
                      size: 30,
                    ),
            ),
          ),
        );
      },
    );
  }
}
