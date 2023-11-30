import 'package:memodio/model/child_model.dart';
import 'package:memodio/screens/home/block/home_screen_cubit.dart';
import 'package:memodio/theme/app_colors.dart';
import 'package:memodio/widgets/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildContainer extends StatelessWidget {
  const ChildContainer(
      {super.key, required this.childData, required this.index});
  final ChildData childData;
  final int index;
  @override
  Widget build(BuildContext context) {
    final homeBlocProvider = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColors.whiteColor),
          color: AppColors.whiteColor.withOpacity(0.5),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor),
                child: Image.asset(
                  "assets/Images/child.webp",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        childData.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      ChildStatusWidget(
                          index: index,
                          isInitial: false,
                          items: homeBlocProvider.childStatus,
                          selectedValue: childData.status)
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    childData.country,
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
