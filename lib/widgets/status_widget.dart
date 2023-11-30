import 'package:memodio/screens/home/block/home_screen_cubit.dart';
import 'package:memodio/screens/home/block/home_screen_state.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildStatusWidget extends StatefulWidget {
  const ChildStatusWidget(
      {super.key,
      required this.items,
      this.selectedValue,
      required this.isInitial,
      required this.index});
  final List<String> items;
  final String? selectedValue;
  final bool isInitial;
  final int index;
  @override
  State<ChildStatusWidget> createState() => _ChildStatusWidgetState();
}

class _ChildStatusWidgetState extends State<ChildStatusWidget> {
  @override
  Widget build(BuildContext context) {
    final homeBlocProvider = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: widget.items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: widget.selectedValue,
                onChanged: (String? value) {
                  if (widget.isInitial) {
                    homeBlocProvider.setChildStatus(value!);
                  } else if (widget.index != -1) {
                    homeBlocProvider.updatechildStatus(value!, widget.index);
                  }
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 120,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
