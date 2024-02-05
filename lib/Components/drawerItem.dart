import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class drawerItem extends StatelessWidget {
  final String name;
  final String Image;
  final double? width;
  final double? height;
  final void Function()? onTap;
  const drawerItem({
    required this.name,
    required this.Image,
    this.onTap,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: SvgPicture.asset(
          Image,
          color: Theme.of(context).primaryColor,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
