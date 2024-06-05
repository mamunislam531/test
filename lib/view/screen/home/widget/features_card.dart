
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class FeaturesCard extends StatelessWidget {
  const FeaturesCard({
    super.key,
    required this.onTap,
    required this.imgUrl,
    required this.title,
  });
  final VoidCallback onTap;
  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            color: AppColors.bgLightColor.withOpacity(.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              //const Icon(Icons.local_pharmacy_sharp,color: AppColors.bg1LightColor,),
              Image.asset(
                imgUrl,
                height: 40,
                width: 200,
                fit: BoxFit.fill,
              ),

              CustomTextWidget(
                text: title,
                fontSize: 15,
                fontColor: AppColors.bg1LightColor,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
