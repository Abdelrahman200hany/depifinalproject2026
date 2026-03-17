// from drop down buttom2 Package version 2 as v 3 not perfect
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropDownButtom extends StatefulWidget {
  const CustomDropDownButtom({
    super.key,
    required this.hint,
    required this.itemsList,
    this.onSaved,
  });
  final String hint;
  final List<String> itemsList;
  final void Function(String?)? onSaved;

  @override
  State<CustomDropDownButtom> createState() => _CustomDropDownButtomState();
}

class _CustomDropDownButtomState extends State<CustomDropDownButtom> {
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      // valueListenable: selectedCity,
      value: selectedCity,
      hint: Text(widget.hint),
      items: widget.itemsList.map((city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(city, style: AppStyle.styleSRegular16(context)),
        );
      }).toList(),

      // تحديث الاختيار فورًا
      onChanged: (value) {
        setState(() {
          selectedCity = value;
        });
      },

      // الحفظ النهائي بعد submit
      onSaved: widget.onSaved,

      // التحقق من صحة الاختيار
      validator: (value) {
        if (value == null || value.isEmpty) return "من فضلك اختر المحافظة";
        return null;
      },
      // to change munu decoration
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF9FAFA),
        ),
      ),

      // تصميم الـ input field
      decoration: InputDecoration(
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder().copyWith(
          borderSide: BorderSide(width: 1, color: AppColor.kPrimaryColor),
        ),
      ),

      alignment: Alignment.centerRight,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
    );
  }
}














// import 'package:depifinalproject/core/utils/app_color.dart';
// import 'package:depifinalproject/core/utils/app_style.dart';
// import 'package:flutter/material.dart';

// class CustomDropDownButtom extends StatefulWidget {
//   const CityDropdownExample({super.key});

//   @override
//   State<CityDropdownExample> createState() => _CityDropdownExampleState();
// }

// class _CityDropdownExampleState extends State<CityDropdownExample> {
//   String? selectedCity;

//   final List<String> egyptGovernorates = [
//     "القاهرة",
//     "الجيزة",
//     "الإسكندرية",
//     "الشرقية",
//     "الدقهلية",
//     "الغربية",
//     "المنوفية",
//     "أسيوط",
//     "سوهاج",
//     "قنا",
//     "الأقصر",
//     "أسوان",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       borderRadius: BorderRadius.circular(12),
//       menuMaxHeight: 200,

//       iconEnabledColor: AppColor.kPrimaryColor,
//       isExpanded: false,

//       // alignment: Alignment.centerRight,
//       value: selectedCity,
//       hint: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.location_on_outlined),
//           SizedBox(width: 2),
//           Text(" المدينة"),
//         ],
//       ),
//       decoration: InputDecoration(
//         fillColor: const Color(0xffF9FAFA),
//         filled: true,
//         border: buildBoreder(),
//         enabledBorder: buildBoreder(),
//         focusedBorder: buildBoreder().copyWith(
//           borderSide: BorderSide(width: 1, color: AppColor.kPrimaryColor),
//         ),
//       ),

//       items: egyptGovernorates.map((city) {
//         return DropdownMenuItem(
//           value: city,
//           child: Text(city, style: AppStyle.styleSRegular16(context)),
//         );
//       }).toList(),

//       onChanged: (value) {
//         selectedCity = value;
//         setState(() {});
//       },
//       onSaved: (value) {
//         selectedCity = value;
//       },
//     );
//   }

//   OutlineInputBorder buildBoreder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
//     );
//   }
// }

//***********************************************************************

