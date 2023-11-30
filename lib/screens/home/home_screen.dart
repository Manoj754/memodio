import 'package:memodio/screens/home/block/home_screen_cubit.dart';
import 'package:memodio/screens/home/block/home_screen_state.dart';
import 'package:memodio/theme/app_colors.dart';
import 'package:memodio/widgets/add_child_bottomsheet.dart';
import 'package:memodio/widgets/child_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            AppColors.whiteColor.withOpacity(0.7),
            AppColors.whiteColor.withOpacity(0.8),
            AppColors.whiteColor.withOpacity(0.7),
          ])),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const AddChildBottomSheet();
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Text(
                            "Add Child",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: AppColors.blackColor, width: 1),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is NoDataHomeState) {
                      return const Center(child: Text("No Child Found"));
                    } else if (state is SucessHomeState) {
                      return ListView.builder(
                        itemCount: state.childs.length,
                        itemBuilder: (context, index) {
                          return ChildContainer(
                            childData: state.childs[index],
                            index: index,
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
