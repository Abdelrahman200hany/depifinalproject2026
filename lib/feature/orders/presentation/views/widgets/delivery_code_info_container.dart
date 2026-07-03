// import 'package:depifinalproject/core/utils/app_color.dart';
// import 'package:flutter/material.dart';

// class DeliveryCodeInfoContainer extends StatelessWidget {
//   const DeliveryCodeInfoContainer({super.key, required this.code});

//   final String code;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,

//       padding: const EdgeInsets.all(16),

//       decoration: BoxDecoration(
//         color: AppColor.kPrimaryColor.withValues(alpha: 0.08),

//         borderRadius: BorderRadius.circular(12),

//         border: Border.all(
//           color: AppColor.kGreyAppColor.withValues(alpha: 0.4),
//         ),
//       ),

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,

//         children: [
//           Row(
//             children: [
//               Icon(Icons.info_outline, color: AppColor.kPrimaryColor),

//               const SizedBox(width: 8),

//               Text(
//                 "ملاحظة",

//                 style: TextStyle(
//                   fontSize: 16,

//                   fontWeight: FontWeight.bold,

//                   color: AppColor.kPrimaryColor,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),

//           Text(
//             "هذا الرقم يجب إرساله للعميل حتى يتمكن من استلام الطرد",

//             style: TextStyle(fontSize: 14, color: AppColor.kGreyAppColor),
//           ),

//           const SizedBox(height: 15),

//           Center(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),

//               decoration: BoxDecoration(
//                 color: Colors.white,

//                 borderRadius: BorderRadius.circular(10),

//                 border: Border.all(color: AppColor.kPrimaryColor, width: 1.2),
//               ),

//               child: Text(
//                 code,

//                 style: const TextStyle(
//                   fontSize: 26,

//                   fontWeight: FontWeight.bold,

//                   letterSpacing: 4,

//                   color: AppColor.kPrimaryColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeliveryCodeInfoContainer extends StatelessWidget {
  const DeliveryCodeInfoContainer({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColor.kPrimaryColor.withValues(alpha: 0.08),

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: AppColor.kGreyAppColor.withValues(alpha: 0.4),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColor.kPrimaryColor),

              const SizedBox(width: 8),

              Text(
                "ملاحظة",

                style: TextStyle(
                  fontSize: 16,

                  fontWeight: FontWeight.bold,

                  color: AppColor.kPrimaryColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            "هذا الرقم يجب إرساله للعميل حتى يتمكن من استلام الطرد",

            style: TextStyle(fontSize: 14, color: AppColor.kGreyAppColor),
          ),

          const SizedBox(height: 15),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(10),

                border: Border.all(color: AppColor.kPrimaryColor, width: 1.2),
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    code,

                    style: const TextStyle(
                      fontSize: 26,

                      fontWeight: FontWeight.bold,

                      letterSpacing: 4,

                      color: AppColor.kPrimaryColor,
                    ),
                  ),

                  const SizedBox(width: 12),

                  InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: code));
                      showSuccessSnackBar(context, message: 'تم نسخ الكود ');
                    },

                    child: Icon(Icons.copy, color: AppColor.kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
