import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/utils/app_data_list.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/custom_drop_down_buttom.dart';

import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/update_user_profile_data/update_user_data_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/update_user_profile_data/update_user_data_state.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/profile_image_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpDateProfileViewBody extends StatefulWidget {
  const UpDateProfileViewBody({super.key});

  @override
  State<UpDateProfileViewBody> createState() => _UpDateProfileViewBodyState();
}

class _UpDateProfileViewBodyState extends State<UpDateProfileViewBody> {

  UserEntity user = getUserData();

  late TextEditingController nameController;

  late TextEditingController phoneController;

  String? selectedCity;

  String? imageUrl;


  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: user.name);

    phoneController =
        TextEditingController(text: user.phoneNumber);

    selectedCity = user.userCity;

    imageUrl = user.imageUrl;
  }


  @override
  void dispose() {

    nameController.dispose();

    phoneController.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: CustomAppBar(
        title: 'تحديث بيانات الحساب',
        wantedIconBack: true,
      ),


      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            children: [


              const SizedBox(height: 24),



              ProfileImageWidget(

                imageUrl: imageUrl,

                onImageChange: (url){

                  imageUrl = url;

                },

              ),



              const SizedBox(height: 24),




              CustomTextFormFeild(

                controller: nameController,

                labelText: 'الاسم',

                textInputType: TextInputType.text,

                hint: user.name,

              ),



              const SizedBox(height: 20),




              CustomTextFormFeild(

                controller: phoneController,

                labelText: 'رقم الهاتف',

                textInputType: TextInputType.phone,

                hint: user.phoneNumber,

              ),




              const SizedBox(height: 20),




              CustomDropDownButtom(

                hint: user.userCity,

                itemsList: AppDataList.egyptGovernorates,


                onSaved: (value){

                  selectedCity = value;

                },

              ),




              const SizedBox(height: 35),




              BlocConsumer<UpdateUserCubit, UpdateUserState>(


                listener: (context,state){



                  if(state is UpdateUserSuccess){


                    showSuccessSnackBar(

                      context,

                      message: 'تم تحديث البيانات بنجاح',

                    );



                    Navigator.pushNamedAndRemoveUntil(

                      context,

                      MainView.routeName,

                      (router)=>false,

                    );


                  }



                  if(state is UpdateUserFailure){


                    showSuccessSnackBar(

                      context,

                      message: state.message,

                    );


                  }



                },





                builder: (context,state){



                  return CustomTextBottomWithBackground(


                    text: state is UpdateUserLoading

                        ? "جاري التحديث..."

                        : "تحديث البيانات",



                    ontap: state is UpdateUserLoading

                        ? null

                        : (){



                      final updatedUser = user.copyWith(


                        name: nameController.text.isEmpty

                            ? user.name

                            : nameController.text,



                        phoneNumber: phoneController.text.isEmpty

                            ? user.phoneNumber

                            : phoneController.text,



                        userCity: selectedCity ?? user.userCity,



                        imageUrl: imageUrl ?? user.imageUrl,



                      );




                      context
                          .read<UpdateUserCubit>()
                          .updateUser(

                        updatedUser: updatedUser,

                      );




                    },


                  );


                },

              ),


            ],

          ),

        ),

      ),

    );

  }

}
// import 'package:depifinalproject/core/methods/get_user_local_data.dart';
// import 'package:depifinalproject/core/methods/show_snack_bar.dart';
// import 'package:depifinalproject/core/utils/app_data_list.dart';
// import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
// import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
// import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
// import 'package:depifinalproject/core/widgets/custom_drop_down_buttom.dart';

// import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
// import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
// import 'package:depifinalproject/feature/profile/pepesentation/manager/update_user_profile_data/update_user_data_cubit.dart';
// import 'package:depifinalproject/feature/profile/pepesentation/manager/update_user_profile_data/update_user_data_state.dart';
// import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/profile_image_widget.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UpDateProfileViewBody extends StatefulWidget {
//   const UpDateProfileViewBody({super.key});

//   @override
//   State<UpDateProfileViewBody> createState() => _UpDateProfileViewBodyState();
// }

// class _UpDateProfileViewBodyState extends State<UpDateProfileViewBody> {
//   UserEntity user = getUserData();

//   late TextEditingController nameController;

//   late TextEditingController phoneController;


//   String? selectedCity;

//   @override
//   void initState() {
//     super.initState();

//     nameController = TextEditingController(text: user.name);

//     phoneController = TextEditingController(text: user.phoneNumber);

//     selectedCity = user.userCity;
//   }

//   @override
//   void dispose() {
//     nameController.dispose();

//     phoneController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'تحديث بيانات الحساب', wantedIconBack: true),

//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),

//           child: Column(
//             children: [
//               SizedBox(height: 24),
//               ProfileImageWidget(
//                 imageUrl: user.imageUrl,
//                 onImageChange: (token) {},
//               ),
//               SizedBox(height: 24),

//               CustomTextFormFeild(
//                 controller: nameController,

//                 labelText: 'الاسم',

//                 textInputType: TextInputType.text,

//                 hint: user.name,
//               ),

//               const SizedBox(height: 20),

//               CustomTextFormFeild(
//                 controller: phoneController,

//                 labelText: 'رقم الهاتف',

//                 textInputType: TextInputType.phone,

//                 hint: user.phoneNumber,
//               ),

//               const SizedBox(height: 20),

//               CustomDropDownButtom(
//                 hint: user.userCity,

//                 itemsList: AppDataList.egyptGovernorates,

//                 onSaved: (value) {
//                   selectedCity = value;
//                 },
//               ),

//               const SizedBox(height: 35),

//               BlocConsumer<UpdateUserCubit, UpdateUserState>(
//                 listener: (context, state) {
//                   if (state is UpdateUserSuccess) {
//                     showSuccessSnackBar(
//                       context,

//                       message: 'تم تحديث البيانات بنجاح',
//                     );

//                     Navigator.pushNamedAndRemoveUntil(
//                       context,

//                       MainView.routeName,

//                       (router) => false,
//                     );
//                   }

//                   if (state is UpdateUserFailure) {
//                     showSuccessSnackBar(context, message: state.message);
//                   }
//                 },

//                 builder: (context, state) {
//                   return CustomTextBottomWithBackground(
//                     text: state is UpdateUserLoading
//                         ? "جاري التحديث..."
//                         : "تحديث البيانات",

//                     ontap: state is UpdateUserLoading
//                         ? null
//                         : () {
//                             final updatedUser = user.copyWith(
//                               name: nameController.text.isEmpty
//                                   ? user.name
//                                   : nameController.text,

//                               phoneNumber: phoneController.text.isEmpty
//                                   ? user.phoneNumber
//                                   : phoneController.text,

//                               userCity: selectedCity ?? user.userCity,
//                             );

//                             context.read<UpdateUserCubit>().updateUser(
//                               updatedUser: updatedUser,
//                             );
//                           },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
