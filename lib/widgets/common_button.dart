import 'package:memodio/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.primaryColor,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
