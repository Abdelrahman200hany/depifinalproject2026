import 'package:depifinalproject/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

void showFullImageDialog({
  required BuildContext context,
  required String imageUrl,
  required int imageVersion,
}) {
  showDialog(
    context: context,

    builder: (_) {
      return Dialog(
        backgroundColor: Colors.black,

        insetPadding: const EdgeInsets.all(40),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,

          width: MediaQuery.of(context).size.width * 0.7,

          child: Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: InteractiveViewer(
                    child: CustomCachedNewtorkimage(
                      imageUrl: imageUrl,

                      imageVersion: imageVersion,

                      height: double.infinity,

                      width: double.infinity,

                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 5,

                right: 5,

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),

                    shape: BoxShape.circle,
                  ),

                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: const Icon(
                      Icons.close,

                      color: Colors.white,

                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
// import 'package:depifinalproject/core/widgets/custom_cached_network_image.dart';
// import 'package:flutter/material.dart';

// void showFullImageDialog({
//   required BuildContext context,
//   required String imageUrl,
//   required int imageVersion,
// }) {
//   showDialog(
//     context: context,

//     builder: (_) {
//       return Dialog(
//         backgroundColor: Colors.black,

//         insetPadding: EdgeInsets.zero,

//         child: Stack(
//           children: [
//             Center(
//               child: InteractiveViewer(
//                 child: CustomCachedNewtorkimage(
//                   imageUrl: imageUrl,

//                   imageVersion: imageVersion,

//                   height: double.infinity,

//                   width: double.infinity,

//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),

//             Positioned(
//               top: 40,

//               right: 20,

//               child: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },

//                 icon: const Icon(Icons.close, color: Colors.white, size: 35),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
