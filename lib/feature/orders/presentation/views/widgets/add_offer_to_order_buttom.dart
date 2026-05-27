import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_model_buttom_sheet.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/utils/app_validation.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/top_head_model_sheet_line.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/add_offer_to_order_by_delivey_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/add_new_offer_to_order/add_new_offer_to_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOfferToOrderButtom extends StatefulWidget {
  const AddOfferToOrderButtom({super.key, required this.item});

  final OrderEntity item;

  @override
  State<AddOfferToOrderButtom> createState() => _AddOfferToOrderButtomState();
}

class _AddOfferToOrderButtomState extends State<AddOfferToOrderButtom> {
  late double offerPrice;
  AutovalidateMode autoValideMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomTextBottomWithBackground(
      text: 'تقديم عرض',
      ontap: () {
        showCustomModelButtomSheet(
          context,
          child: BlocProvider(
            create: (context) =>
                AddDeliveryOfferCubit(getIt.get<AddDeliveryOfferUseCase>()),
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHoriztailPadding,
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: autoValideMode,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TopHeadModelSheetLine(),

                      const SizedBox(height: 24),

                      CustomTextFormFeild(
                        validator: (value) => AppValidation.price(value),
                        textInputType: TextInputType.number,
                        onSaved: (value) {
                          offerPrice = double.parse(value!);
                        },
                        labelText: 'سعر التوصيل',
                      ),

                      const SizedBox(height: 24),

                      BlocConsumer<
                        AddDeliveryOfferCubit,
                        AddDeliveryOfferState
                      >(
                        listener: (context, state) {
                          if (state is AddDeliveryOfferFailure) {
                            showfaulireSnackBar(
                              context,
                              message: state.errorMessage,
                            );
                            Navigator.pop(context);
                          }

                          if (state is AddDeliveryOfferSuccess) {
                            showSuccessSnackBar(
                              context,
                              message: 'تم اضافه العرض بنجاح',
                            );
                              Navigator.pushNamedAndRemoveUntil(
                            context,
                            MainView.routeName,
                            (route) => false,
                          );
                          }
                        
                        },

                        builder: (context, state) {
                          return CustomTextBottomWithBackground(
                            isLoading: state is AddDeliveryOfferLoading,

                            text: 'تقديم العرض',

                            ontap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context
                                    .read<AddDeliveryOfferCubit>()
                                    .addDeliveryOffer(
                                      orderID: widget.item.uIdOrder,

                                      proposedPrice: offerPrice,
                                    );
                              } else {
                                autoValideMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}