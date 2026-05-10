import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/up_data_order_data_by_clinet.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_order_image_by_clinet_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/clinet_order_up_data_manager/clinet_order_up_date_manager_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/up_data_order_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdataOrderView extends StatelessWidget {
  const UpdataOrderView({super.key, required this.orderitem});
  static const String routeName = 'UpdataOrderView';
  final OrderEntity orderitem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClinetOrderUpDateManagerCubit(
        getIt.get<UpDataOrderImageByClinetUseCase>(),
        getIt.get<UpDataOrderDataByClinet>(),
      ),
      child: UpdateOrderViewBodyBlocBuilder(orderitem: orderitem),
    );
  }
}
