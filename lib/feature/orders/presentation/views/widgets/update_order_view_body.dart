import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/pick_date.dart';
import 'package:depifinalproject/core/methods/pick_time.dart';
import 'package:depifinalproject/core/methods/show_dilog.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_data_list.dart';
import 'package:depifinalproject/core/utils/app_validation.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_data_time_feild.dart';
import 'package:depifinalproject/core/widgets/custom_drop_down_buttom.dart';
import 'package:depifinalproject/core/widgets/custom_image_feild.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/add_order_sec_tempelet.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/add_order_sec_title.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/clinet_order_up_data_manager/clinet_order_up_date_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderViewBody extends StatefulWidget {
  const UpdateOrderViewBody({
    super.key,
    required this.order,
    required this.isLoading,
  });

  final OrderEntity order;
  final bool isLoading;

  @override
  State<UpdateOrderViewBody> createState() => _UpdateOrderViewBodyState();
}

class _UpdateOrderViewBodyState extends State<UpdateOrderViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // ✅ نسخة واحدة بس بتتحدث
  late OrderEntity updatedOrder;

  late TextEditingController datePickupController;
  late TextEditingController timePickupController;
  late TextEditingController dataDeliveryController;
  late TextEditingController timeDeliveryController;
  String? pickupGovernorate;
  String? deliveryGovernorate;
  String? orderType;

  @override
  void initState() {
    super.initState();
    updatedOrder = widget.order; // ✅ بنبدأ بنسخة من الأصل

    datePickupController = TextEditingController(text: widget.order.pickupDate);
    timePickupController = TextEditingController(text: widget.order.pickupTime);
    dataDeliveryController = TextEditingController(
      text: widget.order.deliveryDate,
    );
    timeDeliveryController = TextEditingController(
      text: widget.order.deliveryTime,
    );
    pickupGovernorate = widget.order.pickupGovernorate;
    deliveryGovernorate = widget.order.recipientGovernorate;
    orderType = widget.order.parcelType;
  }

  @override
  void dispose() {
    datePickupController.dispose();
    timePickupController.dispose();
    dataDeliveryController.dispose();
    timeDeliveryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تعديل الطلب', wantedIconBack: true),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                const SizedBox(height: 8),

                // ── بيانات الاستلام ───────────────────────────
                AddOrderSecTempelet(
                  child: Column(
                    spacing: 16,
                    children: [
                      AddOrderSecTitle(title: 'بيانات الاستلام'),

                      CustomDropDownButtom(
                        hint: 'محافظه',
                        itemsList: AppDataList.egyptGovernorates,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          pickupGovernorate: v,
                        ),
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.pickupAddress,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          pickupAddress: v,
                        ),
                        validator: AppValidation.address,
                        textInputType: TextInputType.text,
                        labelText: 'عنوان الاستلام',
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.pickupMark,
                        onSaved: (v) =>
                            updatedOrder = updatedOrder.copyWith(pickupMark: v),
                        validator: AppValidation.mark,
                        textInputType: TextInputType.text,
                        labelText: 'علامه مميزة',
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomDateTimeField(
                              controller: datePickupController,
                              labelText: "التاريخ",
                              hint: "اختر معاد الاستلام",
                              validator: AppValidation.date,
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColor.kPrimaryColor,
                              ),
                              onTap: () => pickDate(context, (date) {
                                datePickupController.text = date;
                                updatedOrder = updatedOrder.copyWith(
                                  pickupDate: date,
                                );
                              }),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomDateTimeField(
                              controller: timePickupController,
                              labelText: "الوقت",
                              hint: "اختر وقت الاستلام",
                              validator: AppValidation.time,
                              suffixIcon: const Icon(
                                Icons.watch_later_outlined,
                                color: AppColor.kPrimaryColor,
                              ),
                              onTap: () => pickTime(context, (time) {
                                timePickupController.text = time;
                                updatedOrder = updatedOrder.copyWith(
                                  pickupTime: time,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ── تفاصيل الطرد ──────────────────────────────
                AddOrderSecTempelet(
                  child: Column(
                    spacing: 16,
                    children: [
                      AddOrderSecTitle(title: 'تفاصيل الطرد'),

                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomTextFormFeild(
                              initialValue: updatedOrder.parcelName,
                              onSaved: (v) => updatedOrder = updatedOrder
                                  .copyWith(parcelName: v),
                              validator: AppValidation.name,
                              textInputType: TextInputType.text,
                              labelText: 'اسم الطرد',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: CustomDropDownButtom(
                              hint: 'نوع الطرد',

                              itemsList: AppDataList.orderList,
                              onSaved: (v) => updatedOrder = updatedOrder
                                  .copyWith(parcelType: v),
                            ),
                          ),
                        ],
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.parcelDescription,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          parcelDescription: v,
                        ),
                        validator: AppValidation.description,
                        maxLines: 5,
                        textInputType: TextInputType.text,
                        hint: 'وصف الطرد',
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.additionalNotes,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          additionalNotes: v,
                        ),
                        validator: AppValidation.optionalNotes,
                        textInputType: TextInputType.text,
                        hint: 'ملاحظات اضافية للمندوب',
                      ),

                      ImageFiled(
                        
                        existingImageUrl: widget.order.parcelImage,
                        onFileChang: (file) => updatedOrder = updatedOrder
                            .copyWith(imageFile: file),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFeild(
                              initialValue: updatedOrder.parcelPrice.toString(),
                              onSaved: (v) =>
                                  updatedOrder = updatedOrder.copyWith(
                                    parcelPrice: double.tryParse(v ?? ''),
                                  ),
                              validator: AppValidation.price,
                              textInputType: TextInputType.number,
                              labelText: 'سعر الطرد',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomTextFormFeild(
                              initialValue: updatedOrder.deliveryPrice
                                  .toString(),
                              onSaved: (v) =>
                                  updatedOrder = updatedOrder.copyWith(
                                    deliveryPrice: double.tryParse(v ?? ''),
                                  ),
                              validator: AppValidation.deliveryPrice,
                              textInputType: TextInputType.number,
                              labelText: 'سعر التوصيل',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ── بيانات التسليم ────────────────────────────
                AddOrderSecTempelet(
                  child: Column(
                    spacing: 16,
                    children: [
                      AddOrderSecTitle(title: 'بيانات التسليم'),

                      CustomDropDownButtom(
                        hint: 'محافظه',
                        itemsList: AppDataList.egyptGovernorates,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          recipientGovernorate: v,
                        ),
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.recipientName,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          recipientName: v,
                        ),
                        validator: AppValidation.name,
                        textInputType: TextInputType.text,
                        labelText: 'اسم المستلم',
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.recipientAddress,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          recipientAddress: v,
                        ),
                        validator: AppValidation.address,
                        textInputType: TextInputType.text,
                        labelText: 'عنوان المستلم',
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.recipientMark,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          recipientMark: v,
                        ),
                        validator: AppValidation.mark,
                        textInputType: TextInputType.text,
                        labelText: 'علامه مميزة',
                      ),

                      CustomTextFormFeild(
                        initialValue: updatedOrder.recipientPhone,
                        onSaved: (v) => updatedOrder = updatedOrder.copyWith(
                          recipientPhone: v,
                        ),
                        validator: AppValidation.phone,
                        textInputType: TextInputType.phone,
                        labelText: 'رقم هاتف المستلم',
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomDateTimeField(
                              controller: dataDeliveryController,
                              labelText: "التاريخ",
                              hint: "اختر معاد التسليم",
                              validator: AppValidation.date,
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColor.kPrimaryColor,
                              ),
                              onTap: () => pickDate(context, (date) {
                                dataDeliveryController.text = date;
                                updatedOrder = updatedOrder.copyWith(
                                  deliveryDate: date,
                                );
                              }),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomDateTimeField(
                              controller: timeDeliveryController,
                              labelText: "الوقت",
                              hint: "اختر وقت التسليم",
                              validator: AppValidation.time,
                              suffixIcon: const Icon(
                                Icons.watch_later_outlined,
                                color: AppColor.kPrimaryColor,
                              ),
                              onTap: () => pickTime(context, (time) {
                                timeDeliveryController.text = time;
                                updatedOrder = updatedOrder.copyWith(
                                  deliveryTime: time,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                CustomTextBottomWithBackground(
                  isLoading: widget.isLoading,
                  text: 'تحديث الطلب',
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      showPop(
                        context: context,
                        content: 'هل انت متاكد من تحديث البيانات',
                        title: 'تحديث البينات',
                        onConfirm: () async {
                          await context
                              .read<ClinetOrderUpDateManagerCubit>()
                              .updateOrder(
                                orderId: widget.order.uIdOrder,
                                oldOrder: widget.order,
                                newOrder: updatedOrder,
                              );
                       
                        },
                      );
                    } else {
                      setState(
                        () => autovalidateMode = AutovalidateMode.always,
                      );
                    }
                  },
                ),

                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
