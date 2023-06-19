// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meddis/views/components/custom_button.dart';
import 'package:meddis/views/utils/color.dart';

class MenuCards extends StatelessWidget {
  const MenuCards({
    Key? key,
    this.isPrimaryColors = true,
    required this.title,
    required this.images,
    this.fontSize = 18,
    this.imageSize = 95,
    this.onTap,
  }) : super(key: key);
  final bool isPrimaryColors;
  final String title;
  final String images;
  final double fontSize;
  final double imageSize;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      surfaceTintColor: Colors.transparent,
      elevation: 3,
      color: isPrimaryColors ? MyColor.primary : Colors.white,
      child: SizedBox(
        height: size.height * 0.257,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    color: isPrimaryColors ? Colors.white : MyColor.primary),
              ),
            ),
            SizedBox(
              height: imageSize,
              child: Image.asset(
                images,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    secondaryColor: isPrimaryColors,
                    text: "Check",
                    onPressed: onTap,
                    height: 38,
                    width: 80,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
