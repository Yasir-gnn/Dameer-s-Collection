import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customContainer extends StatelessWidget {
  final Color color;
  final String? text;
  final double? margin;
  const customContainer({
    required this.color,
    this.text,
    this.margin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: margin ?? 2.w),
      padding: const EdgeInsets.all(5),
      height: 4.5.h,
      width: 9.w,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: color),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
