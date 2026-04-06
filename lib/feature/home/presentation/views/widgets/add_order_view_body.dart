import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_data_list.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_drop_down_buttom.dart';
import 'package:depifinalproject/core/widgets/custom_image_feild.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/add_order_sec_title.dart';
import 'package:flutter/material.dart';

class AddOrderViewBody extends StatelessWidget {
  const AddOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ' إضافة طلب توصيل', wantedIconBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              const SizedBox(height: 12),

              AddOrderSecTitle(title: 'بيانات الاستلام'),
              CustomDropDownButtom(
                hint: 'محافظه',
                itemsList: AppDataList.egyptGovernorates,
                onSaved: (value) {},
              ),

              CustomTextFormFeild(
                textInputType: TextInputType.text,
                labelText: 'عنوان الاستلام',
              ),
              CustomTextFormFeild(
                textInputType: TextInputType.text,
                labelText: 'علامه مميزة',
              ),

              // order details [ product name - product type - product description - additional notes - product image]
              AddOrderSecTitle(title: 'تفاصيل الطرد  '),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextFormFeild(
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
                      onSaved: (value) {},
                    ),
                  ),
                ],
              ),

              CustomTextFormFeild(
                maxLines: 5,
                textInputType: TextInputType.text,
                hint: 'وصف الطرد  ',
              ),
              CustomTextFormFeild(
                textInputType: TextInputType.text,
                hint: 'ملاحظات اضافيه للمندوب',
              ),
              ImageFiled(onFileChang: (file) {}),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFeild(
                      textInputType: TextInputType.text,
                      labelText: 'سعر الطرد',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextFormFeild(
                      textInputType: TextInputType.text,
                      labelText: 'سعر التوصيل',
                    ),
                  ),
     
                ],
              ),

              // delivery details [ recipient name - recipient address - recipient phone number - recipient mark]
              AddOrderSecTitle(title: 'بيانات التسليم'),

              CustomDropDownButtom(
                hint: 'محافظه',
                itemsList: AppDataList.egyptGovernorates,
                onSaved: (value) {},
              ),

              CustomTextFormFeild(
                textInputType: TextInputType.text,
                labelText: 'اسم المستلم',
              ),
              CustomTextFormFeild(
                textInputType: TextInputType.text,
                labelText: 'عنوان المستلم',
              ),
              CustomTextFormFeild(
                textInputType: TextInputType.text,
                labelText: 'علامه مميزة',
              ),
              CustomTextFormFeild(
                textInputType: TextInputType.phone,
                labelText: 'رقم هاتف المستلم',
              ),
              SizedBox(height: 12),

              CustomTextBottomWithBackground(text: 'انشاء طلب '),
              SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
