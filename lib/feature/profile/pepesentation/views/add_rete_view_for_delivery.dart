import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_simple_order_data_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/update_simple_order/update_simple_order_cubit.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/add_rate/add_rate_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/add_rate/add_rate_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRateViewFordelivery extends StatefulWidget {
  const AddRateViewFordelivery({
    super.key,
    required this.targetUserId,
    required this.user,
    required this.orderID,
  });

  final String targetUserId;
  final UserEntity user;
  final String orderID;
  @override
  State<AddRateViewFordelivery> createState() => _AddRateViewFordeliveryState();
}

class _AddRateViewFordeliveryState extends State<AddRateViewFordelivery> {
  final TextEditingController controller = TextEditingController();

  int selectedRate = 0;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<AddRateCubit>()),
        BlocProvider(
          create: (context) =>
              UpdateSimpleOrderCubit(getIt.get<UpdateSimpleOrderDataUseCase>()),
        ),
      ],

      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       MainView.routeName,
          //       (route) => false,
          //     );
          //   },
          //   icon: Icon(Icons.arrow_back, color: Colors.red),
          // ),
          title: const Text("إضافة تقييم"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              CustomTextFormFeild(
                controller: controller,

                maxLines: 4,

                textInputType: TextInputType.text,

                hint: 'اكتب رايك هنا',
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        selectedRate = index + 1;
                      });
                    },

                    icon: Icon(
                      Icons.star,

                      size: 40,

                      color: index < selectedRate ? Colors.orange : Colors.grey,
                    ),
                  );
                }),
              ),

              const Spacer(),

              BlocConsumer<AddRateCubit, AddRateState>(
                listener: (context, state) {
                  if (state is AddRateSuccess) {
                    showSuccessSnackBar(
                      context,
                      message: "تم إضافة التقييم بنجاح",
                    );

                    Navigator.pushNamedAndRemoveUntil(
                      context,

                      MainView.routeName,

                      (route) => false,
                    );
                  }

                  if (state is AddRateFailure) {
                    showSuccessSnackBar(context, message: state.message);
                  }
                },

                builder: (context, state) {
                  return CustomTextBottomWithBackground(
                    isLoading: state is AddRateLoading ? true : false,
                    ontap: () {
                      if (selectedRate == 0) {
                        showSuccessSnackBar(
                          context,

                          message: "اختر عدد النجوم",
                        );

                        return;
                      }

                      final rate = RateEntity(
                        rate: selectedRate,

                        rateString: controller.text,

                        user: widget.user,
                      );

                      context.read<AddRateCubit>().addRate(
                        targetUserId: widget.targetUserId,

                        rate: rate,
                      );
                      context
                          .read<UpdateSimpleOrderCubit>()
                          .updateSimpleOrderData(
                            orderId: widget.orderID,
                            data: {'deliverReviwed':true},
                          );
                    },

                    text: "تأكيد",
                  );
                },
              ),
              const SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
