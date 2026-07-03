import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/chat/presentation/manager/get_or_create_chat/get_or_create_chat_cubit.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/create_chat_buttom.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data_sec_with_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomClientOverAllDataDetails extends StatelessWidget {
  const CustomClientOverAllDataDetails({
    super.key,
    required this.orderItem,
    required this.name,
    required this.phone,
  });

  final OrderEntity orderItem;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecDataWithWidget(
      title: 'بيانات التاجر',

      icon: BlocProvider(
        create: (_) => getIt<GetOrCreateChatCubit>(),
        child: CreateChatButtom(orderItem: orderItem, isClient: false , createdBy: orderItem.deliveryId,),
      ),

      children: [
        OrderItemDeatilsData(title: 'اسم التاجر', dataDetails: name),
        OrderItemDeatilsData(title: 'رقم الهاتف', dataDetails: phone),
      ],
    );
  }
}
