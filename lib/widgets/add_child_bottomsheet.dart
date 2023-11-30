import 'package:memodio/screens/home/block/home_screen_cubit.dart';
import 'package:memodio/screens/home/block/home_screen_state.dart';
import 'package:memodio/theme/app_colors.dart';
import 'package:memodio/widgets/common_button.dart';
import 'package:memodio/widgets/common_textfield.dart';
import 'package:memodio/widgets/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddChildBottomSheet extends StatefulWidget {
  const AddChildBottomSheet({super.key});

  @override
  State<AddChildBottomSheet> createState() => _AddChildBottomSheetState();
}

class _AddChildBottomSheetState extends State<AddChildBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeBlocProvider = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
          ),
          CommonTextField(
            controller: nameController,
            labelText: "Enter Name",
          ),
          const SizedBox(
            height: 10,
          ),
          CommonTextField(
            controller: countryController,
            labelText: "Enter Country name",
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyColor, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: ChildStatusWidget(
                    index: -1,
                    isInitial: true,
                    items: homeBlocProvider.childStatus,
                    selectedValue: homeBlocProvider.selectedStatus),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {},
            child: CommonButton(
              title: "Add Child",
              onPressed: () {
                homeBlocProvider.addChildData(
                    name: nameController.text.trim(),
                    country: countryController.text.trim(),
                    status: homeBlocProvider.selectedStatus!);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
