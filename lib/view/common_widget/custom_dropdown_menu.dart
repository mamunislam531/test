
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({super.key, required this.list, required this.initialSelection, required this.function});
  final List<String> list;
  final String initialSelection;
  final Function(String?) function;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownMenu<String>(
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          constraints: BoxConstraints.tight(const Size.fromHeight(40)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        width: MediaQuery.sizeOf(context).width - 30,
        initialSelection: initialSelection,
        onSelected: function,
        menuHeight: 220,
        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(
            value: value,
            label: value,
            labelWidget: CustomTextWidget(text: value, fontColor: AppColors.bg1LightColor),
            leadingIcon: const Icon(Icons.arrow_right_sharp, color: AppColors.bg1LightColor),
          );
        }).toList(),
      ),
    );
  }
}
