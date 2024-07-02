import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task16/utils/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final String image;
  final String text;
  final bool isActive;
  final VoidCallback? onTap;

  const CustomIcon({
    super.key,
    required this.image,
    required this.text,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.iconBackgroundActiveColor
                  : AppColors.iconBackgroundInactiveColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SvgPicture.asset(
                image,
                width: 32,
                height: 32,
                color: isActive
                    ? AppColors.primaryColor
                    : AppColors.whiteColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: isActive
                ? AppColors.primaryColor
                : AppColors.iconBackgroundInactiveColor,
          ),
        ),
      ],
    );
  }
}
