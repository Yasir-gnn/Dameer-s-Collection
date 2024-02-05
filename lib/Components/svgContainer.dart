import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// class svgContainer extends StatelessWidget {
//   final String image;
//   final Color backgroundColor;
//   final Color iconColor;
//   const svgContainer({
//     required this.image,
//     required this.backgroundColor,
//     required this.iconColor,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       height: 4.5.h,
//       width: 9.w,
//       decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(50)),
//           color: backgroundColor),
//       child: SvgPicture.asset(
//         image,
//         color: iconColor,
//         height: 4.h,
//         width: 4.w,
//       ),
//     );
//   }
// }

class svgContainer extends StatelessWidget {
  final String? image;
  final Color? backgroundColor;
  final Color? iconColor;
  const svgContainer({
    required this.image,
    required this.backgroundColor,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 4.5.h,
      width: 9.w,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: backgroundColor),
      child: SvgPicture.asset(
        image!,
        color: iconColor,
        height: 4.h,
        width: 4.w,
      ),
    );
  }
}
