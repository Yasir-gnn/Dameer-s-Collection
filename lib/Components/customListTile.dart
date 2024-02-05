import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customListTile extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const customListTile({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: SvgPicture.asset(
        '${AppConstants.assetSvgIcons}Vector.svg',
        color: Theme.of(context).primaryColor,
        height: 2.h,
      ),
      onTap: onTap,
    );
  }
}
