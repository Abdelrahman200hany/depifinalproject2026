import 'dart:io';

import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/generate_uid.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/methods/pick_date.dart';
import 'package:depifinalproject/core/methods/pick_time.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
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
import 'package:depifinalproject/feature/home/presentation/manger/add_new_order_cubit.dart/add_new_order_cubit.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/add_order_sec_tempelet.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/add_order_sec_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderViewBody extends StatefulWidget {
  const AddOrderViewBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<AddOrderViewBody> createState() => _AddOrderViewBodyState();
}

class _AddOrderViewBodyState extends State<AddOrderViewBody> {
  TextEditingController datePickupController = TextEditingController();
  TextEditingController timePickupController = TextEditingController();
  TextEditingController dataDeliveryController = TextEditingController();
  TextEditingController timeDeliveryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    datePickupController.dispose();
    timePickupController.dispose();
    dataDeliveryController.dispose();
    timeDeliveryController.dispose();
    super.dispose();
  }

  // pickup
  String? pickupGovernorate;
  late String pickupAddress;
  late String pickupMark;
  late String pickupDate;
  late String pickupTime;

  // order details
  late String orderName;
  String? orderType;
  late String orderDescription;
  late String additionalNotes;
  late double orderPrice;
  late double deliveryPrice;
  File? orderimagefile;

  // delivery
  String? deliveryGovernorate;
  late String deliveryName;
  late String deliveryAddress;
  late String deliveryMark;
  late String deliveryPhone;
  late String deliveryDate;
  late String deliveryTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ' إضافة طلب توصيل', wantedIconBack: true),
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

                AddOrderSecTempelet(
                  child: Column(
                    spacing: 16,
                    children: [
                      AddOrderSecTitle(title: 'بيانات الاستلام'),

                      CustomDropDownButtom(
                        hint: ' محافظه',
                        itemsList: AppDataList.egyptGovernorates,
                        onSaved: (value) {
                          pickupGovernorate = value;
                        },
                      ),

                      CustomTextFormFeild(
                        onSaved: (value) {
                          pickupAddress = value!;
                        },
                        validator: (p) => AppValidation.address(p),
                        textInputType: TextInputType.text,
                        labelText: 'عنوان الاستلام',
                      ),

                      CustomTextFormFeild(
                        onSaved: (value) {
                          pickupMark = value!;
                        },
                        validator: (p) => AppValidation.mark(p),
                        textInputType: TextInputType.text,
                        labelText: 'علامه مميزة',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDateTimeField(
                              validator: (p) => AppValidation.date(p),
                              controller: datePickupController,
                              labelText: "التاريخ",
                              hint: "اخترمعاد الاستلام",
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColor.kPrimaryColor,
                              ),

                              onTap: () {
                                pickDate(context, (date) {
                                  datePickupController.text = date;
                                  pickupDate = date;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),

                          Expanded(
                            child: CustomDateTimeField(
                              controller: timePickupController,
                              labelText: "الوقت ",
                              hint: "اختر وقت الاستلام ",
                              validator: (p) => AppValidation.time(p),
                              suffixIcon: const Icon(
                                Icons.watch_later_outlined,
                                color: AppColor.kPrimaryColor,
                              ),

                              onTap: () {
                                pickTime(context, (date) {
                                  timePickupController.text = date;
                                  pickupTime = date;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // order details [ product name - product type - product description - additional notes - product image]
                AddOrderSecTempelet(
                  child: Column(
                    spacing: 16,
                    children: [
                      AddOrderSecTitle(title: 'تفاصيل الطرد  '),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomTextFormFeild(
                              onSaved: (value) {
                                orderName = value!;
                              },
                              validator: (p) => AppValidation.name(p),
                              textInputType: TextInputType.text,
                              labelText: 'اسم الطرد  ',
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: CustomDropDownButtom(
                              hint: 'نوع الطرد',
                              itemsList: AppDataList.orderList,
                              onSaved: (value) {
                                orderType = value;
                              },
                            ),
                          ),
                        ],
                      ),

                      CustomTextFormFeild(
                        onSaved: (value) {
                          orderDescription = value!;
                        },
                        validator: (p) => AppValidation.description(p),

                        maxLines: 5,
                        textInputType: TextInputType.text,
                        hint: 'وصف الطرد  ',
                      ),
                      CustomTextFormFeild(
                        onSaved: (value) {
                          additionalNotes = value!;
                        },
                        validator: (p) => AppValidation.optionalNotes(p),
                        textInputType: TextInputType.text,
                        hint: 'ملاحظات اضافيه للمندوب',
                      ),
                      ImageFiled(
                        onFileChang: (file) {
                          orderimagefile = file;
                        },
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFeild(
                              onSaved: (value) {
                                orderPrice = double.parse(value!);
                              },
                              validator: (p) => AppValidation.price(p),
                              textInputType: TextInputType.number,
                              labelText: 'سعر الطرد',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomTextFormFeild(
                              onSaved: (value) {
                                deliveryPrice = double.parse(value!);
                              },
                              validator: (p) => AppValidation.deliveryPrice(p),
                              textInputType: TextInputType.number,
                              labelText: 'سعر التوصيل',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // delivery details [ recipient name - recipient address - recipient phone number - recipient mark]
                AddOrderSecTempelet(
                  child: Column(
                    spacing: 16,
                    children: [
                      AddOrderSecTitle(title: 'بيانات التسليم'),

                      CustomDropDownButtom(
                        hint: 'محافظه',
                        itemsList: AppDataList.egyptGovernorates,
                        onSaved: (value) {
                          deliveryGovernorate = value;
                        },
                      ),

                      CustomTextFormFeild(
                        onSaved: (value) {
                          deliveryName = value!;
                        },
                        validator: (p0) => AppValidation.name(p0),
                        textInputType: TextInputType.text,
                        labelText: 'اسم المستلم',
                      ),
                      CustomTextFormFeild(
                        onSaved: (value) {
                          deliveryAddress = value!;
                        },
                        validator: (p0) => AppValidation.address(p0),
                        textInputType: TextInputType.text,
                        labelText: 'عنوان المستلم',
                      ),
                      CustomTextFormFeild(
                        onSaved: (value) {
                          deliveryMark = value!;
                        },
                        validator: (p0) => AppValidation.mark(p0),
                        textInputType: TextInputType.text,
                        labelText: 'علامه مميزة',
                      ),
                      CustomTextFormFeild(
                        onSaved: (value) {
                          deliveryPhone = value!;
                        },
                        validator: (p0) => AppValidation.phone(p0),
                        textInputType: TextInputType.phone,
                        labelText: 'رقم هاتف المستلم',
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomDateTimeField(
                              validator: (p) => AppValidation.date(p),

                              controller: dataDeliveryController,
                              labelText: "التاريخ",
                              hint: "اخترمعاد التسليم",
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColor.kPrimaryColor,
                              ),

                              onTap: () {
                                pickDate(context, (date) {
                                  dataDeliveryController.text = date;
                                  deliveryDate = date;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),

                          Expanded(
                            child: CustomDateTimeField(
                              validator: (p) => AppValidation.time(p),
                              controller: timeDeliveryController,
                              labelText: "الوقت ",
                              hint: "اختر وقت التسليم ",
                              suffixIcon: const Icon(
                                Icons.watch_later_outlined,
                                color: AppColor.kPrimaryColor,
                              ),

                              onTap: () {
                                pickTime(context, (date) {
                                  timeDeliveryController.text = date;
                                  deliveryTime = date;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),

                CustomTextBottomWithBackground(
                  isLoading: widget.isLoading,
                  text: 'انشاء طلب ',
                  ontap: () {
                    if (orderimagefile == null) {
                      showfaulireSnackBar(
                        context,
                        message: ' من فضلك قم بإضافة صورة للطرد',
                      );
                    } else {
                      if (pickupGovernorate != null &&
                          deliveryGovernorate != null &&
                          orderType != null) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<AddNewOrderCubit>().addNewCompleteOrder(
                            order: OrderEntity(
                              imageFile: orderimagefile!,
                              uIdOrder: generateUID(),
                              createdBy: getUserData().userID!,

                              senderName: getUserData().name,
                              senderPhone: getUserData().phoneNumber,

                              // pickup
                              pickupAddress: pickupAddress,
                              pickupDate: pickupDate,
                              pickupGovernorate: pickupGovernorate!,
                              pickupMark: pickupMark,
                              pickupTime: pickupTime,

                              // parcel
                              parcelDescription: orderDescription,
                              parcelName: orderName,
                              parcelPrice: orderPrice,
                              parcelType: orderType!,
                              additionalNotes: additionalNotes,
                              deliveryPrice: deliveryPrice,

                              // delivery (recipient)
                              recipientAddress: deliveryAddress,
                              recipientGovernorate: deliveryGovernorate!,
                              recipientName: deliveryName,
                              recipientPhone: deliveryPhone,
                              recipientMark: deliveryMark,

                              deliveryDate: deliveryDate,
                              deliveryTime: deliveryTime,
                            ),
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      } else {
                        showfaulireSnackBar(
                          context,
                          message:
                              'تأكد من إدخال كل بيانات الطرد المطلوبة بشكل صحيح',
                        );
                      }
                    }
                  },
                ),

                SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
