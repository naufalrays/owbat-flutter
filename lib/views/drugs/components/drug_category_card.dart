import 'package:flutter/material.dart';

import 'package:meddis/views/utils/custom_text_style.dart';

class DrugCategoryCard extends StatelessWidget {
  const DrugCategoryCard({
    Key? key,
    required this.title,
    required this.assetImage,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String assetImage;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  title,
                  maxLines: 2,
                  style: CustomTextStyle.drugCategoryCardTextStyle,
                ),
              ),
              // Used to cut the line to customize the card
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 40,
                  child: Image.asset(
                    assetImage,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
